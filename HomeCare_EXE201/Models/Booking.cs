using System;
using System.Collections.Generic;

namespace HomeCare_EXE201.Models;

public partial class Booking
{
    public int Id { get; set; }

    public int? CleanerId { get; set; }

    public int CustomerId { get; set; }

    public string Address { get; set; } = null!;

    public DateOnly? Date { get; set; }

    public string? Status { get; set; }

    public decimal TotalPrice { get; set; }

    public DateTime CreateAt { get; set; }

    public string? CreateBy { get; set; }

    public DateTime? UpdateAt { get; set; }

    public string? UpdateBy { get; set; }

    public bool? IsDeleted { get; set; }

    public virtual ICollection<BookingDetail> BookingDetails { get; set; } = new List<BookingDetail>();

    public virtual ICollection<BookingService> BookingServices { get; set; } = new List<BookingService>();

    public virtual User Customer { get; set; } = null!;

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

    public virtual ICollection<Report> Reports { get; set; } = new List<Report>();

    public virtual ICollection<Review> Reviews { get; set; } = new List<Review>();
}
