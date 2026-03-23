using Pract_12.Data;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace Pract_15_TRPO.Models;

public partial class Product : ObservableObject
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

    private string _description;
    public string Description
    {
        get => _description;
        set => SetProperty(ref _description, value);
    }
    private int _price;
    public int Price
    {
        get => _price;
        set => SetProperty(ref _price, value);
    }

    private int _stock;
    public int Stock
    {
        get => _stock;
        set => SetProperty(ref _stock, value);
    }

    private int? _ratting;
    public int? Rating
    {
        get => _ratting;
        set => SetProperty(ref _ratting, value);
    }

    private DateTime? _createdAt = DateTime.Now;
    public DateTime? CreatedAt
    {
        get => _createdAt;
        set => SetProperty(ref _createdAt, value);
    }

    private int? _categoryId;
    public int? CategoryId
    {
        get => _categoryId;
        set => SetProperty(ref _categoryId, value);
    }

    private int? _brandId;
    public int? BrandId
    {
        get => _brandId;
        set => SetProperty(ref _brandId, value);
    }

    private Brand _brand;
    public Brand Brand
    {
        get => _brand;
        set => SetProperty(ref _brand, value); 
    }
    private Category _category;
    public Category Category
    {
        get => _category;
        set => SetProperty(ref _category, value);
    }
    private ObservableCollection<ProductTag> _productTag;
    public ObservableCollection<ProductTag> ProductTags
    {
        get => _productTag;
        set => SetProperty(ref _productTag, value);
    }


}
