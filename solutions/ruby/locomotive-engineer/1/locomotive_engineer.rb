class LocomotiveEngineer
  def self.generate_list_of_wagons(*w) = w
  def self.fix_list_of_wagons(each_wagons_id, missing_wagons) = [1, *missing_wagons, *each_wagons_id.drop(3), *each_wagons_id.take(2)]
  def self.extend_route_information(route, more_route_information) = route.merge(more_route_information)
  def self.add_missing_stops(hsh, **stops)
    hsh[:stops] = stops.values
    hsh
  end
end
