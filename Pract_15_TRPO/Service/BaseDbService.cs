using Pract_15_TRPO.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pract_15_TRPO.Service
{
    public class BaseDbService
    {
        private BaseDbService()
        {
            context = new DeminPract15Context();
        }
        private static BaseDbService? instance;
        public static BaseDbService Instance
        {
            get
            {
                if (instance == null)
                    instance = new BaseDbService();
                return instance;
            }
        }
        private DeminPract15Context context;
        public DeminPract15Context Context => context;
    }
}
