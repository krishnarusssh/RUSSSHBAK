<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<script runat="server">
    
 void Application_BeginRequest(object sender, EventArgs e)
    {
        HttpContext context = HttpContext.Current;
        string path = Request.Path;
        if (path.Contains("appdownload"))
        {
            string lastword = "";
            string[] words = path.Split('/');
            for (int i = 0; i <= words.Length - 1; i++)
            {
                lastword = words[i].ToString();
            }
            if (lastword.ToString().ToLower() != "default.aspx")
            {
                context.RewritePath("~/appdownload/default.aspx?code=" + lastword, false);

            }
            else
            {
                context.RewritePath("~/appdownload/default.aspx?code=NONE", false);
            }

        }
       
       if (path.Contains("AGR"))
        {
            string lastword = "";
            string[] words = path.Split('/');
            for (int i = 0; i <= words.Length - 1; i++)
            {
                lastword = words[i].ToString();
            }
            if (lastword.ToString().ToLower() != "default.aspx")
            {
                context.RewritePath("~/Agree.aspx?LINKID=" + lastword, false);

            }
           

        }
         





        
    }

void Application_Start(object sender, EventArgs e) 
    {
        RegisterRoutes(RouteTable.Routes);
    }
    
    static void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("Grocery Delivery", "services/grocery-shopping-and-delivery/", "~/services/grocery-delivery-in-mumbai/default.aspx");
        routes.MapPageRoute("Electronic Items Delivery", "services/Laptop-computer-hard-drive-usb-delivery/", "~/services/laptop-mobile-usb-charger-delivery-in-mumbai/default.aspx");
	    routes.MapPageRoute("Document Delivery", "services/same-day-document-delivery/", "~/services/same-day-document-delivery-in-mumbai/default.aspx");
	    routes.MapPageRoute("Cake Delivery", "services/cake-delivery/", "~/services/cake-delivery-mumbai-thane-navi-mumbai/default.aspx");
		routes.MapPageRoute("Cheque and Cash Delivery", "services/cash-cheque-delivery/", "~/services/cash-pickup-and-delivery-service-in-mumbai/default.aspx");
		routes.MapPageRoute("Food Delivery", "services/food-delivery/", "~/services/food-delivery-in-mumbai-thane-navi-mumbai/default.aspx");
		routes.MapPageRoute("Clothes Delivery", "services/clothes-delivery-service/", "~/services/same-day-delivery-of-dress-shoe-accessory/default.aspx");
		routes.MapPageRoute("Parcel Delivery", "services/parcel-delivery/", "~/services/send-a-parcel/default.aspx");
		routes.MapPageRoute("Chocolate Basket Delivery", "services/chocolate-delivery/", "~/services/chocolate-delivery-service-for-chocolatiers/default.aspx");
		routes.MapPageRoute("Bulk Deliveries", "services/bulk-delivery/", "~/services/arrange-collection-of-many-parcels-in-one-go/default.aspx");
		routes.MapPageRoute("Personal Deliveries", "services/personal-assistance-for-business/sme-and-home-business-delivery-service/", "~/services/default.aspx");
		routes.MapPageRoute("Home Errands Food Deliveries", "services/home-errands/food-delivery/", "~/services/default.aspx");
		


		routes.MapPageRoute("Laundry Deliveries", "services/home-errands/laundry-pick-up-services/", "~/services/default.aspx");
		routes.MapPageRoute("Flower Deliveries", "services/flower-delivery/", "~/services/flower-delivery/default.aspx");
		routes.MapPageRoute("Bread Deliveries", "services/home-errands/bread-delivery/", "~/services/default.aspx");
		routes.MapPageRoute("Card Deliveries", "services/card-delivery-service/", "~/services/default.aspx");
		routes.MapPageRoute("Demand Fashion Deliveries", "services/on-demand-fashion-services/", "~/services/default.aspx");
		routes.MapPageRoute("Courier Deliveries", "services/courier-services/", "~/services/send-a-parcel/default.aspx");
		routes.MapPageRoute("Crockery Deliveries", "services/Crockery-utensils-jar-delivery/", "~/services/default.aspx");
		routes.MapPageRoute("Home Errands Card Deliveries", "services/home-errands/card-delivery-service/", "~/services/default.aspx");
		routes.MapPageRoute("Cake Home Deliveries", "services/home-errands/cake-home-delivery/", "~/services/default.aspx");
		routes.MapPageRoute("Cake Home Errands Deliveries", "services/home-errands/cake-delivery/", "~/services/default.aspx");
		routes.MapPageRoute("Personal Demand Fashion Deliveries", "services/personal-assistance-for-individuals/on-demand-fashion-services/", "~/services/default.aspx");
		routes.MapPageRoute("Chocolate Deliveries", "services/personal-assistance-for-individuals/chocolate-delivery/", "~/services/default.aspx");
		routes.MapPageRoute("Personal Bakery Deliveries", "services/personal-assistance-for-individuals/bakery-delivery/", "~/services/default.aspx");
		routes.MapPageRoute("Personal Courier Deliveries", "services/personal-assistance-for-business/courier-services/", "~/services/default.aspx");
		routes.MapPageRoute("Personal Flower Deliveries", "services/personal-assistance-for-individuals/flower-delivery/", "~/services/default.aspx");
  }
</script>
