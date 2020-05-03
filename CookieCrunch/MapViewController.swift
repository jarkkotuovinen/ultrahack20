import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate {
  var newConfirmedFinland = 0;
  var newConfirmedSweden = 0;
  var newConfirmedSpain = 0;
  var newConfirmedItaly = 0;
  var sourceView: UIView?

  override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let receiverVC = segue.destination as! GameViewController
    receiverVC.text = newConfirmedFinland
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("ADD YOUR KEY HERE")

      let camera = GMSCameraPosition.camera(withLatitude: 48.1733244, longitude: 9.9410248, zoom: 4.0)
      let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
      mapView.delegate = self
      self.view.addSubview(mapView)
      
        if let url = URL(string: "https://api.covid19api.com/summary") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                    let res = try JSONDecoder().decode(Response.self, from: data)
                    let countries = res.Countries;
                     
                    // print(res.Countries.first(where: where:{$0.name == "Finland"}))
                    
                    if let foo1 = countries.first(where: {$0.Country == "Finland"}) {
                      self.newConfirmedFinland = foo1.NewConfirmed;
                    } else {
                      print("item could not be found")
                    }
                    if let foo2 = countries.first(where: {$0.Country == "Sweden"}) {
                      self.newConfirmedSweden = foo2.NewConfirmed;
                    } else {
                      print("item could not be found")
                    }
                    if let foo3 = countries.first(where: {$0.Country == "Spain"}) {
                      self.newConfirmedSpain = foo3.NewConfirmed;
                    } else {
                      print("item could not be found")
                    }
                    if let foo4 = countries.first(where: {$0.Country == "Italy"}) {
                      self.newConfirmedItaly = foo4.NewConfirmed;
                    } else {
                      print("item could not be found")
                    }
                    
                  } catch let error {
                     print(error)
                  }
               }
           }.resume()
        }


        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 60.1733244, longitude: 24.9410248)
        marker.title = "Finland"
        marker.snippet = String(newConfirmedFinland)
        marker.map = mapView
        marker.icon = UIImage(named: "circlesmallest")
      
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 60.13, longitude: 18.64)
        marker2.title = "Sweden"
        marker2.snippet = String(newConfirmedSweden)
        marker2.map = mapView
        marker2.icon = UIImage(named: "circlesmaller")
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 40.46, longitude: -3.75)
        marker3.title = "Spain"
        marker3.snippet = String(newConfirmedSpain)
        marker3.map = mapView
        marker3.icon = UIImage(named: "circle")
        
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: 41.87, longitude: 12.57)
        marker4.title = "Italy"
        marker4.snippet = String(newConfirmedItaly)
        marker4.map = mapView
        marker4.icon = UIImage(named: "circlesmall")
      
        do {
            // Set the map style by passing the URL of the local file. Make sure style.json is present in your project
            if let styleURL = Bundle.main.url(forResource: "styles", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                print("Unable to find styles.json")
            }
        } catch {
            print("The style definition could not be loaded: \(error)")
        }
  }
  
  @objc func buttonClicked() {
      print("Button Clicked")
  }
  
  func mapView(_ mapview: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
    
    let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 300))
    view.backgroundColor = UIColor.white
    view.layer.cornerRadius = 6
    
    let title = UILabel(frame: CGRect.init(x: 10, y: 10, width: view.frame.width - 16, height: 15))
    title.text = marker.title;
    
    let title2 = UILabel(frame: CGRect.init(x: 10, y: 40, width: view.frame.width - 16, height: 15))
  
    let title3 = UILabel(frame: CGRect.init(x: 85, y: 150, width: view.frame.width - 16, height: 15))
    title3.text = "PLAY";
        
    if (marker.title == "Spain") {
      title2.text = "New infections: ";
      title2.text! += String(newConfirmedSpain)
    } else if (marker.title == "Sweden") {
      title2.text = "New infections: ";
      title2.text! += String(newConfirmedSweden);
    } else if (marker.title == "Italy") {
      title2.text = "New infections: ";
       title2.text! += String(newConfirmedItaly);
     } else {
      title2.text = String(newConfirmedFinland);
    }
    
    // String(newConfirmedFinland)
    view.addSubview(title)
    view.addSubview(title2)
    view.addSubview(title3)

    if (marker.title == "Finland") {
      let seconds = 3.0
      DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        self.performSegue(withIdentifier: "gameSegue", sender: nil)
      }
    }

    return view
    }
  
  struct Response: Codable { // or Decodable
    struct countries: Codable {
      let Country: String
      let CountryCode: String
      let Slug: String
      let NewConfirmed: Int
      let TotalConfirmed: Int
      let NewDeaths: Int
      let TotalDeaths: Int
      let NewRecovered: Int
      let TotalRecovered: Int
      let Date: String
    }
    let Countries: [countries]
  }
}
