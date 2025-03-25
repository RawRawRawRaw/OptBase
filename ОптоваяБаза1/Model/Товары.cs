using System;
using System.Collections.Generic;

namespace ОптоваяБаза1.Model;

public partial class Товары
{
    public int Код { get; set; }

    public string? Название { get; set; }

    public int? КоличествоСклад { get; set; }

    public string? ЕдиницаИзмерения { get; set; }

    public int? Стоимость { get; set; }

    public string? Описание { get; set; }

    public virtual ICollection<База> Базаs { get; set; } = new List<База>();
}
