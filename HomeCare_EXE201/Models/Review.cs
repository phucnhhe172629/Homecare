using System;
using System.Collections.Generic;

namespace HomeCare_EXE201.Models;

public partial class Review
{
    public int Id { get; set; }

    public int CustomerId { get; set; }

    public int BookingId { get; set; }

    public int? Rating { get; set; }

    public string? Comment { get; set; }

    public DateTime CreateAt { get; set; }

    public string? CreateBy { get; set; }

    public DateTime? UpdateAt { get; set; }

    public string? UpdateBy { get; set; }

    public bool? IsDeleted { get; set; }

    public virtual Booking Booking { get; set; } = null!;
}
