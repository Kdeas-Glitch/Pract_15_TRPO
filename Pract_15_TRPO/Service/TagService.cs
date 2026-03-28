using Microsoft.EntityFrameworkCore;
using Pract_15_TRPO.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Pract_15_TRPO.Service
{
    public class TagService
    {
        private readonly DeminPract15Context _db = BaseDbService.Instance.Context;
        public ObservableCollection<Tag> Tags { get; set; } = new();
        public int Commit() => _db.SaveChanges();

        public TagService()
        {
            GetAll();
        }

        public void Add(Tag tages)
        {
            var tag = new Tag
            {
                Name = tages.Name,
            };
            _db.Add<Tag>(tag);
            Commit();
            Tags.Add(tag);
        }
        public void GetAll()
        {
            var tags = _db.Tags
                .Include(s => s.ProductTags)
                .ToList();
            Tags.Clear();
            foreach (var prod in tags)
            {
                Tags.Add(prod);
            }
        }

        public void Remove(Tag tag)
        {
            //_db.Remove<Tag>(tag);
            //if (Commit() > 0)
            //    if (Tags.Contains(tag))
            //        Tags.Remove(tag);

            if (tag.ProductTags != null && tag.ProductTags.Any())
            {


                _db.ProductTags.RemoveRange(tag.ProductTags);
            }

            _db.Tags.Remove(tag);

            int rowsAffected = Commit();

            if (rowsAffected > 0)
            {

                if (Tags.Contains(tag))
                    Tags.Remove(tag);

            }
            else
            {
                MessageBox.Show("Не удалось удалить тег.", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
