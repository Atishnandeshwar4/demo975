//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Znode.Multifront.PaymentApplication.Data
{
    using System;
    using System.Collections.Generic;
     using Znode.Multifront.PaymentApplication.Models;
    public partial class ZNodePaymentType : ZnodePaymentEntityBaseModel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ZNodePaymentType()
        {
            this.ZNodePaymentSettings = new HashSet<ZNodePaymentSetting>();
        }
    
        public int PaymentTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public System.DateTime ModifiedDate { get; set; }
        public string BehaviorType { get; set; }
        public string Code { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ZNodePaymentSetting> ZNodePaymentSettings { get; set; }
    }
}