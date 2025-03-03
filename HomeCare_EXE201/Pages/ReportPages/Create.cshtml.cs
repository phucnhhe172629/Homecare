using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using HomeCare_EXE201.Models;
using HomeCare_Common.Emun;

namespace HomeCare_EXE201.Pages.ReportPages
{
    public class CreateModel : PageModel
    {
        private readonly HomeCare_EXE201.Models.HomeCareExe201Context _context;
        private List<Booking> bookingList;

        public CreateModel(HomeCare_EXE201.Models.HomeCareExe201Context context)
        {
            _context = context;
            bookingList = _context.Bookings.Where(b => b.CleanerId == 1).ToList();
                //.Where(b => BookingStatus.Complete.ToString().Equals(b.Status)).ToList();
        }

        public IActionResult OnGet()
        {
            ViewData["BookingId"] = new SelectList(bookingList, "Id", "Id");
            return Page();
        }

        [BindProperty]
        public Report Report { get; set; } = default!;

        // For more information, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            //if (!ModelState.IsValid)
            //{
            //    return Page();
            //}

            var bookingReport = _context.Bookings.FirstOrDefault(b => b.Id == Report.BookingId);

            if (!bookingList.Contains(bookingReport))
            {
                return Page();
            }

            Report.Booking = bookingReport;
            Report.Status = ReportStatus.Submitted.ToString();
            Report.CreateAt = DateTime.Now;
            Report.CreateBy = "1";
            Report.UpdateAt = DateTime.Now;
            Report.UpdateBy = "1";
            Report.IsDeleted = false;
            _context.Reports.Add(Report);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
