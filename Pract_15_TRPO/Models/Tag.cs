using Pract_12.Data;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace Pract_15_TRPO.Models;

public partial class Tag : ObservableObject
{
    private int _id;
    public int Id
    {
        get => _id;
        set => SetProperty(ref _id, value);
    }

    private string _name;
    public string Name
    {
        get => _name;
        set => SetProperty(ref _name, value);
    }

    private ObservableCollection<ProductTag> _productTag;
    public ObservableCollection<ProductTag> ProductTags
    {
        get => _productTag;
        set => SetProperty(ref _productTag, value);
    }
}
