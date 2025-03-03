using HomeCare_Common.Emun;
using HomeCare_EXE201.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HomeCare_EXE201.Pages.BookingPages
{
    public class BookModel : PageModel
    {

        private readonly HomeCare_EXE201.Models.HomeCareExe201Context _context;

        public BookModel(HomeCare_EXE201.Models.HomeCareExe201Context context)
        {
            _context = context;
        }


        [BindProperty]
        public DateTime? SelectedDate { get; set; }

        [BindProperty]
        public string SelectedDuration { get; set; }  // Ví dụ: "3 giờ"

        // Các dịch vụ được chọn (danh sách các tên dịch vụ, tách bởi dấu phẩy)
        [BindProperty]
        public string SelectedServices { get; set; }

        [BindProperty]
        public bool WeeklyRepeat { get; set; }

        public List<DateTime> DateList { get; set; }

        [BindProperty]
        public decimal Price { get; set; }

        [BindProperty]
        public Booking Booking { get; set; } = new Booking();

        public void OnGet()
        {
            var today = DateTime.Today;
            var start = today.AddDays(1);

            // Lấy 14 ngày từ hôm nay + 1, ví dụ 2 tuần
            var tempList = Enumerable.Range(0, 6)
                                     .Select(i => start.AddDays(i))
                                     .ToList();

            // Chỉ giữ lại ngày có DayOfWeek != Sunday
            DateList = tempList.Where(d => d.DayOfWeek != DayOfWeek.Sunday).ToList();
        }
        

        public async Task<IActionResult> OnPostAsync()
        {
            // Khởi tạo Booking nếu nó chưa được tạo
            if (Booking == null)
            {
                Booking = new Booking();
            }
            Booking.CustomerId = 1;
            Booking.Customer = _context.Users.FirstOrDefault(u => u.Id == Booking.CustomerId);
            Booking.Status = BookingStatus.Pending.ToString();
            Booking.CreateAt = DateTime.Now;
            Booking.CreateBy = "1";
            Booking.UpdateAt = DateTime.Now;
            Booking.UpdateBy = "1";
            Booking.IsDeleted = false;
            if (SelectedDate.HasValue)
            {
                DateOnly date = DateOnly.FromDateTime(SelectedDate.Value);
                Booking.Date = date;
            }
            Booking.Address = "Khu GD&ĐT, khu CNC Hoà Lạc, KM29, Đại lộ Thăng Long, huyện Thạch Thất, TP Hà Nội, Hanoi, Vietnam";
            Booking.TotalPrice = Price;

            _context.Bookings.Add(Booking);
            await _context.SaveChangesAsync();

            BookingDetail bookingDetail = new BookingDetail();
            bookingDetail.BookingId = Booking.Id;
            bookingDetail.CreateAt = DateTime.Now;
            bookingDetail.CreateBy = "1";
            bookingDetail.UpdateAt = DateTime.Now;
            bookingDetail.UpdateBy = "1";
            bookingDetail.IsDeleted = false;
            _context.BookingDetails.Add(bookingDetail);

            BookingService bookingService = new BookingService();
            bookingService.BookingId = Booking.Id;
            bookingService.ServiceId = 1;
            bookingService.CreateAt = DateTime.Now;
            bookingService.CreateBy = "1";
            bookingService.UpdateAt = DateTime.Now;
            bookingService.UpdateBy = "1";
            bookingService.IsDeleted = false;
            _context.BookingServices.Add(bookingService);

            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
