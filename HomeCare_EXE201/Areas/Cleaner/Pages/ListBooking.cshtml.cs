using HomeCare_EXE201.Models;
using HomeCare_EXE201.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace HomeCare_EXE201.Areas.Cleaner.Pages
{
    public class ListBookingModel : PageModel
    {
        private readonly HomeCareExe201Context _context;
        private readonly IBookService _bookService;

        public List<Booking> booksList { get; set; }

        public ListBookingModel(HomeCareExe201Context context, IBookService bookService)
        {
            _context = context;
            _bookService = bookService;
        }
        public void OnGet()
        {
            booksList = _bookService.GetListBooking().Where(x => x.Status.Equals("Pending") || x.Status.Equals("InProgress")).ToList();
        }

        public IActionResult OnPostAccept(int id)
        {
            var booking = _context.Bookings.Find(id);
            if (booking != null)
            {
                booking.Status = "InProgress";
                booking.CleanerId = 3;
                _context.SaveChanges();
            }
            return RedirectToPage();
        }
        public IActionResult OnPostDecline(int id)
        {
            var booking = _context.Bookings.Find(id);
            if (booking != null)
            {
                booking.Status = "Declined";
                _context.SaveChanges();
            }
            return RedirectToPage();
        }

        public JsonResult OnGetServices(int bookingId)
        {
            var services = _context.BookingServices.Include(x => x.Service)
                .Where(s => s.BookingId == bookingId)
                .Select(s => new
                {
                    s.Service.Name,
                    s.Service.Price,
                    s.Service.Description,
                }).ToList();

            return new JsonResult(services);
        }
    }
}
