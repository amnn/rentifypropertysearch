module PropertyHelper

    # Radius of Earth (average)
    R     = 6371
    ToRad = Math::PI / 180

    # Distance between two property objects (haversine function)
    def distance from, to

        lat1  = from.latitude  * ToRad
        lat2  = to.latitude    * ToRad

        long1 = from.longitude * ToRad
        long2 = to.longitude   * ToRad

        dLat  = lat2  -  lat1
        dLong = long2 - long1

        sinLat  = Math::sin( dLat  / 2 )
        sinLong = Math::sin( dLong / 2 )

        a = sinLat          *          sinLat + 
            sinLong         *         sinLong * 
            Math::cos(lat1) * Math::cos(lat2)

        2 * R * Math::atan2( Math::sqrt( a ), Math::sqrt( 1 - a ) )

    end

end
