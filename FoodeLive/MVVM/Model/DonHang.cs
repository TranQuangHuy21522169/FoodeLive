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
    
    public partial class DonHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonHang()
        {
            this.ChiTietDonHangs = new HashSet<ChiTietDonHang>();
        }
    
        public int SoDonHang { get; set; }
        public Nullable<System.DateTime> NgayLapDonHang { get; set; }
        public string TenNguoiDung { get; set; }
        public Nullable<decimal> TriGia { get; set; }
        public string TieuDe { get; set; }
        public string GhiChu { get; set; }
        public string MaNV { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }
        public virtual NguoiDung NguoiDung { get; set; }
        public virtual NhanVien NhanVien { get; set; }
    }
}
