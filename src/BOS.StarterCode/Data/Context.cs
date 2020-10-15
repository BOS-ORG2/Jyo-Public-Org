using BOS.StarterCode.Models;
using Microsoft.EntityFrameworkCore;
namespace BOS.StarterCode.Data
{
    public class Context : DbContext
    {
        public Context(DbContextOptions<Context> options) : base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
        }
    }
}
