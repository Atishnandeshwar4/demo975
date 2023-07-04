using Newtonsoft.Json;
using PayPal.Api;
using System;
using System.Net.Http;
using System.Text;

namespace Znode.Multifront.PaymentApplication.Providers
{
    public class PaypalExpressRestClient
    {
        #region Private Member Variables
        private readonly String url;
        private readonly String userpass;
        private readonly String username;
        private readonly String password;
        #endregion

        public PaypalExpressRestClient(String url, String username, String password)
        {
            if (IsEmpty(url)) throw new ArgumentException("url parameter is required");
            if (IsEmpty(username)) throw new ArgumentException("username parameter is required");
            if (IsEmpty(password)) throw new ArgumentException("password parameter is required");
 
            if (!url.EndsWith("/")) url = url + "/";
            this.url = url; 
            this.username = username;
            this.password = password;
            this.userpass = username + ":" + password;
        }

        #region Public Method
       
        public T PostResourceFromEndpoint<T, P>(string requestUri, P requestTemp)
        {
            var uri = new Uri(url + requestUri);
            HttpRequestMessage request = SetRequestHeader(username, password);

            request.RequestUri = uri;
            request.Method = new HttpMethod("POST");
            request.Content = new StringContent(ToJSON(requestTemp).ToString(), Encoding.UTF8, "application/json");

            T tempModel;
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage response = client.SendAsync(request).Result)
                {
                    using (HttpContent content = response.Content)
                    {
                        tempModel = JsonConvert.DeserializeObject<T>(content.ReadAsStringAsync().Result);
                    }
                }
            }
            return tempModel;
        }

        public T PostResourceFromEndpoint<T>(string requestUri)
        {
            var uri = new Uri(url + requestUri);
            HttpRequestMessage request = SetRequestHeader(username, password);

            request.RequestUri = uri;
            request.Method = new HttpMethod("POST");

            T tempModel;
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage response = client.SendAsync(request).Result)
                {
                    using (HttpContent content = response.Content)
                    {
                        tempModel = JsonConvert.DeserializeObject<T>(content.ReadAsStringAsync().Result);
                    }
                }
            }
            return tempModel;
        }

        public T GetResourceFromEndpoint<T>(string requestUri)
        {
            var uri = new Uri(url + requestUri);
            HttpRequestMessage request = SetRequestHeader(username, password);

            request.RequestUri = uri;
            request.Method = new HttpMethod("GET");

            T tempModel;
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage response = client.SendAsync(request).Result)
                {
                    using (HttpContent content = response.Content)
                    {
                        tempModel = JsonConvert.DeserializeObject<T>(content.ReadAsStringAsync().Result);
                    }
                }
            }
            return tempModel;
        }

        public static string ToJSON(object t)
        {
            try
            {
                return JsonConvert.SerializeObject(t, Newtonsoft.Json.Formatting.Indented);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public HttpRequestMessage SetRequestHeader(string username, string password)
        {
            HttpRequestMessage request = new HttpRequestMessage();
            request.Headers.Add("PayPal-Request-Id", Guid.NewGuid().ToString());
            request.Headers.Add("Prefer", "return=representation");
            request.Headers.Add("Authorization", GetAccessToken(username, password));

            return request;
        }

        #endregion

        #region Private Method

        //GenerateToken
        private string GetAccessToken(string username, string password)
        {
            string accessToken = new OAuthTokenCredential(username, password).GetAccessToken();
            return accessToken;
        }

        private Boolean IsEmpty(String s)
        {
            if (s == null) return true;
            if (s.Length <= 0) return true;
            if ("".Equals(s)) return true;
            return false;
        }

        #endregion
    }
}
