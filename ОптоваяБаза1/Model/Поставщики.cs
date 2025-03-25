using System;
using System.Collections.Generic;

namespace ОптоваяБаза1.Model;

public partial class Поставщики
{
    public int Номер { get; set; }

    public string? Адрес { get; set; }

    public string? Телефон { get; set; }

    public string? Фио { get; set; }

    public DateTime? СрокПоставки { get; set; }

    public int? КолвоТоваровПоставки { get; set; }

    public int? НомерСчета { get; set; }

    public virtual ICollection<База> Базаs { get; set; } = new List<База>();
}
