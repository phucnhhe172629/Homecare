using HomeCare_EXE201.Models;
using Microsoft.EntityFrameworkCore;

namespace HomeCare_EXE201.Service
{
    public interface IBookService
    {
        List<Booking> GetListBooking();
    }
    public class BookService : IBookService
    {
        private readonly HomeCareExe201Context _context;
        private readonly IHttpContextAccessor _contextAccessor;

        public BookService(HomeCareExe201Context context, IHttpContextAccessor contextAccessor)
        {
            _context = context;
            _contextAccessor = contextAccessor;
        }
        public List<Booking> GetListBooking()
        {
            List<Booking> booksList = _context.Bookings.Include(b => b.Customer).ToList();
            return booksList;
        }
    }
}
