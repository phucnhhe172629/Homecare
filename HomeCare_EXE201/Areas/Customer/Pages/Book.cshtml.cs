using HomeCare_Common.Emun;
using HomeCare_EXE201.Models;
using HomeCare_EXE201.Service;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HomeCare_EXE201.Pages.BookingPages
{
    [Area("Customer")]
    public class BookModel : PageModel
    {

        private readonly HomeCare_EXE201.Models.HomeCareExe201Context _context;
        private readonly IUserService _userService;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly UserManager<User> _userManager;


        public BookModel(HomeCare_EXE201.Models.HomeCareExe201Context context, IUserService userService,
            IHttpContextAccessor contextAccessor, UserManager<User> userManager)
        {
            _context = context;
            _userService = userService;
            _contextAccessor = contextAccessor;
            _userManager = userManager;
        }

        public User User { get; set; } = new User();

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

            var customerId = _userManager.GetUserId(_contextAccessor.HttpContext.User);
            var user = _context.Users.FirstOrDefault(x => x.Id == int.Parse(customerId));

            User = user;
        }


        public IActionResult OnPost()
        {
            var customerId = _userManager.GetUserId(_contextAccessor.HttpContext.User);
            var user = _context.Users.FirstOrDefault(x => x.Id == int.Parse(customerId));

            // Khởi tạo Booking nếu nó chưa được tạo
            if (Booking == null)
            {
                Booking = new Booking();
            }

            Booking.CustomerId = user.Id;
            Booking.Customer = _context.Users.FirstOrDefault(u => u.Id == Booking.CustomerId);
            Booking.Status = BookingStatus.Pending.ToString();
            Booking.CreateAt = DateTime.Now;
            Booking.CreateBy = customerId;
            Booking.UpdateAt = DateTime.Now;
            Booking.UpdateBy = customerId;
            Booking.IsDeleted = false;

            if (SelectedDate.HasValue)
            {
                DateOnly date = DateOnly.FromDateTime(SelectedDate.Value);
                Booking.Date = date;
            }

            Booking.Address = user.City + ", " + user.Province + ", " + user.Street;
            Booking.TotalPrice = Price;

            // Thêm Booking
            _context.Bookings.Add(Booking);
            _context.SaveChanges();

            // Tạo BookingDetail
            BookingDetail bookingDetail = new BookingDetail
            {
                BookingId = Booking.Id,
                CreateAt = DateTime.Now,
                CreateBy = customerId,
                UpdateAt = DateTime.Now,
                UpdateBy = customerId,
                IsDeleted = false
            };
            _context.BookingDetails.Add(bookingDetail);

            Models.Service service = new Models.Service
            {
                Name = "Dọn theo giờ",
                Price = Price,
                Description = SelectedDuration + " - " + SelectedServices,
                CreateAt = DateTime.Now,
                CreateBy = customerId,
                UpdateAt = DateTime.Now,
                UpdateBy = customerId
            };
            _context.Services.Add(service);
            _context.SaveChanges();

            //int a = _context.Services.Count();
            

            // Tạo BookingService
            BookingService bookingService = new BookingService
            {
                BookingId = Booking.Id,
                ServiceId = service.Id,
                CreateAt = DateTime.Now,
                CreateBy = customerId,
                UpdateAt = DateTime.Now,
                UpdateBy = customerId,
                IsDeleted = false
            };
            _context.BookingServices.Add(bookingService);

            // Lưu thay đổi lần nữa
            _context.SaveChanges();

            // Điều hướng về trang Index
            return RedirectToPage("/ListBooking", new { area = "Customer" });
        }
    }
}
