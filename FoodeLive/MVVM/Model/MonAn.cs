//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FoodeLive.MVVM.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class MonAn
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MonAn()
        {
            this.ChiTietDonHangs = new HashSet<ChiTietDonHang>();
            this.ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
        }
    
        public string MaMonAn { get; set; }
        public string TenMonAn { get; set; }
        public Nullable<decimal> Gia { get; set; }
        public string MaCuaHang { get; set; }
        public string ImgUrl { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }
        public virtual CuaHang CuaHang { get; set; }
    }
}
