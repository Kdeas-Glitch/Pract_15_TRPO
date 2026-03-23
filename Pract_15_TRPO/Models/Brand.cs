using Pract_12.Data;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace Pract_15_TRPO.Models;

public partial class Brand : ObservableObject
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


    public ObservableCollection<Product> _products;

    public ObservableCollection<Product> Products
    {
        get => _products;
        set => SetProperty(ref _products, value);
    }

}
