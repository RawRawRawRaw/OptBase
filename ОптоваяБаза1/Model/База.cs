using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ОптоваяБаза1.Model;

public partial class База
{
    public int КодТовара { get; set; }

    public int НомерПоставщика { get; set; }

    public int Ключ { get; set; }

    public virtual Товары КодТовараNavigation { get; set; } = null!;

    public virtual Поставщики НомерПоставщикаNavigation { get; set; } = null!;
}
