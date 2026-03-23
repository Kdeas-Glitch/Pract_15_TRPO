using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Pract_15_TRPO.Models;

public partial class DeminPract15Context : DbContext
{
    public DeminPract15Context()
    {
    }

    public DeminPract15Context(DbContextOptions<DeminPract15Context> options)
        : base(options)
    {
    }

    public  DbSet<Brand> Brands { get; set; }

    public  DbSet<Category> Categories { get; set; }

    public  DbSet<Product> Products { get; set; }

    public  DbSet<Tag> Tags { get; set; }

    public  DbSet<ProductTag> ProductTags { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Server = localhost; Database = demin_pract_15_; Trusted_Connection = True; TrustServerCertificate = True; ");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {

        modelBuilder.Entity<Product>()
            .HasOne(d => d.Brand)
            .WithMany(p => p.Products)
            .HasForeignKey(d => d.BrandId);

        modelBuilder.Entity<Product>()
            .HasOne(d => d.Category)
            .WithMany(p => p.Products)
            .HasForeignKey(d => d.CategoryId);

        modelBuilder.Entity<ProductTag>()
            .HasKey(pt => new { pt.ProductId, pt.TagId });

        modelBuilder.Entity<ProductTag>()
            .ToTable("Product_tags");

        modelBuilder.Entity<ProductTag>()
            .HasOne(pt => pt.Product)
            .WithMany(p => p.ProductTags)
            .HasForeignKey(pt => pt.ProductId)
            .OnDelete(DeleteBehavior.ClientSetNull);

        // Связь ProductTag с Tag
        modelBuilder.Entity<ProductTag>()
            .HasOne(pt => pt.Tag)
            .WithMany(t => t.ProductTags)
            .HasForeignKey(pt => pt.TagId)
            .OnDelete(DeleteBehavior.ClientSetNull);


        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
