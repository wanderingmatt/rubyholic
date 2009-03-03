if defined? GeoIP
  GEOIPDB = GeoIP.new("#{RAILS_ROOT}/app/geoip/GeoLiteCity.dat")
end