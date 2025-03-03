using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using HomeCare_EXE201.Models;

namespace HomeCare_EXE201.Pages.BookingPages
{
    public class DetailsModel : PageModel
    {
        private readonly HomeCare_EXE201.Models.HomeCareExe201Context _context;

        public DetailsModel(HomeCare_EXE201.Models.HomeCareExe201Context context)
        {
            _context = context;
        }

        public Booking Booking { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var booking = await _context.Bookings.FirstOrDefaultAsync(m => m.Id == id);
            if (booking == null)
            {
                return NotFound();
            }
            else
            {
                Booking = booking;
            }
            return Page();
        }
    }
}
