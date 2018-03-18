using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FleetLibrary;
namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            
            FleetDL fd = new FleetDL();
            try{
                List<AddOn> list = new List<AddOn>();
                list = fd.GetSelectedAddons(25);
                foreach (AddOn item in list)
                {
                    Console.WriteLine(item.AddonID);
                }
            }
            catch(Exception e){
                Console.WriteLine(e.ToString());
            }
        }
    }
}
