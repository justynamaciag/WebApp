namespace WebAppDemo
{
      public class Shipment
    {
        public string ShipName { get; set; }
        public object CreatingDate { get; set; }
        public object Loads { get; set; }
        public object Address { get; set; }
        public Shipment()
        {

        }
        public Shipment(string ShipName, object Address, object CreatingDate, object Loads)
        {
            this.ShipName = ShipName;
            this.CreatingDate = CreatingDate;
            this.Loads = Loads;
            this.Address= Address;
            
        }
    }
    
}