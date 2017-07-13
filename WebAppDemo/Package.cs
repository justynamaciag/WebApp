using System;

namespace WebAppDemo
{
    public class Package
    {
        public string PackageName{ get; }
        public object CreatingDate { get; }
        public object ClosingDate { get; }
        public object Opened { get; }
        public object City { get; }
        public string Shipment { get; }
        
        public Package()
        {
            /*this.PackageName = "";
            this.City = "";
            this.CreatingDate = "";
            this.ClosingDate = "";
            this.Opened = "";
            this.Shipment = "";*/
        }

        public Package(string PackageName, object CreatingDate, object ClosingDate, object Opened, object City, string Shipment)
        {
            this.PackageName = PackageName;
            this.City = City;
            this.CreatingDate = CreatingDate;
            this.ClosingDate = ClosingDate;
            this.Opened = Opened;
            this.Shipment = Shipment;
        }

    }
}