using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using HomeCare_EXE201.Models;
using HomeCare_Common.Emun;
using Microsoft.EntityFrameworkCore;

namespace HomeCare_EXE201.Pages.BookingPages
{
    public class CreateModel : PageModel
    {
        private readonly HomeCare_EXE201.Models.HomeCareExe201Context _context;

        public CreateModel(HomeCare_EXE201.Models.HomeCareExe201Context context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            var cleanerList = _context.Users.Include(u => u.UserRoles).Where(u => u.UserRoles.Any(r => r.RoleId == 3)).ToList();
            ViewData["CleanerId"] = new SelectList(cleanerList, "Id", "UserName");
            ViewData["ServiceId"] = new SelectList(_context.Services, "Id", "Name");
            return Page();
        }

        [BindProperty]
        public Booking Booking { get; set; } = default!;

        // For more information, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            Booking.Customer = _context.Users.FirstOrDefault(u => u.Id == Booking.CustomerId);
            //if (!ModelState.IsValid)
            //{
            //    return Page();
            //}

            Booking.CustomerId = 1;
            Booking.Status = BookingStatus.Pending.ToString();
            Booking.CreateAt = DateTime.Now;
            Booking.CreateBy = "1";
            Booking.UpdateAt = DateTime.Now;
            Booking.UpdateBy = "1";
            Booking.IsDeleted = false;
            _context.Bookings.Add(Booking);
            await _context.SaveChangesAsync();

            int bookingId = Booking.Id;

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
