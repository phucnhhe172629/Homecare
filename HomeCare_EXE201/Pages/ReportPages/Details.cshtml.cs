using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using HomeCare_EXE201.Models;

namespace HomeCare_EXE201.Pages.ReportPages
{
    public class DetailsModel : PageModel
    {
        private readonly HomeCare_EXE201.Models.HomeCareExe201Context _context;

        public DetailsModel(HomeCare_EXE201.Models.HomeCareExe201Context context)
        {
            _context = context;
        }

        public Report Report { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var report = await _context.Reports.FirstOrDefaultAsync(m => m.Id == id);
            if (report == null)
            {
                return NotFound();
            }
            else
            {
                Report = report;
            }
            return Page();
        }
    }
}
