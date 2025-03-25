using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ОптоваяБаза1.Model;

public partial class ОптоваяБазаContext : DbContext
{
    public ОптоваяБазаContext()
    {
    }

    public ОптоваяБазаContext(DbContextOptions<ОптоваяБазаContext> options)
        : base(options)
    {
    }

    public virtual DbSet<View1> View1s { get; set; }

    public virtual DbSet<View2> View2s { get; set; }

    public virtual DbSet<View3> View3s { get; set; }

    public virtual DbSet<База> Базаs { get; set; }

    public virtual DbSet<Поставщики> Поставщикиs { get; set; }

    public virtual DbSet<Товары> Товарыs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-AUUBG2G\\SQLEXPRESS02; Database=ОптоваяБаза; Encrypt=false; Trusted_Connection=True");
    //=> optionsBuilder.UseSqlServer("Server=localhost\\sqlexpress; Database=ОптоваяБаза; User=исп-41; Password=1234567890; Encrypt=false");
    //вместо \\ надо \
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<View1>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("View1");

            entity.Property(e => e.Название).HasMaxLength(50);
            entity.Property(e => e.Фио)
                .HasMaxLength(50)
                .HasColumnName("ФИО");
        });

        modelBuilder.Entity<View2>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("View2");

            entity.Property(e => e.Название).HasMaxLength(50);
            entity.Property(e => e.Фио)
                .HasMaxLength(50)
                .HasColumnName("ФИО");
        });

        modelBuilder.Entity<View3>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("View3");

            entity.Property(e => e.НазваниеТовара).HasMaxLength(50);
        });

        modelBuilder.Entity<База>(entity =>
        {
            entity.HasKey(e => e.Ключ);

            entity.ToTable("База");

            entity.Property(e => e.Ключ).ValueGeneratedNever();

            entity.HasOne(d => d.КодТовараNavigation).WithMany(p => p.Базаs)
                .HasForeignKey(d => d.КодТовара)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_База_Товары");

            entity.HasOne(d => d.НомерПоставщикаNavigation).WithMany(p => p.Базаs)
                .HasForeignKey(d => d.НомерПоставщика)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_База_Поставщики");
        });

        modelBuilder.Entity<Поставщики>(entity =>
        {
            entity.HasKey(e => e.Номер);

            entity.ToTable("Поставщики");

            entity.Property(e => e.Номер).ValueGeneratedNever();
            entity.Property(e => e.Адрес).HasMaxLength(50);
            entity.Property(e => e.СрокПоставки).HasColumnType("datetime");
            entity.Property(e => e.Телефон).HasMaxLength(50);
            entity.Property(e => e.Фио)
                .HasMaxLength(50)
                .HasColumnName("ФИО");
        });

        modelBuilder.Entity<Товары>(entity =>
        {
            entity.HasKey(e => e.Код);

            entity.ToTable("Товары");

            entity.Property(e => e.Код).ValueGeneratedNever();
            entity.Property(e => e.ЕдиницаИзмерения).HasMaxLength(50);
            entity.Property(e => e.Название).HasMaxLength(50);
            entity.Property(e => e.Описание).HasMaxLength(150);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
