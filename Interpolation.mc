import Toybox.Lang;

module MyBarrel{
    (:math)
    module Math2{
        function interpolateY(x1 as Numeric, y1 as Numeric, x2 as Numeric, y2 as Numeric, xRef as Numeric) as Numeric{
            return y1 + (xRef-x1) * (y2-y1) / (x2-x1);
        }
        
        function interpolateX(x1 as Numeric, y1 as Numeric, x2 as Numeric, y2 as Numeric, yRef as Numeric) as Numeric{
            return interpolateY(y1, x1, y2, x2, yRef);
        }

        function interpolateXY(x1 as Numeric, y1 as Numeric, x2 as Numeric, y2 as Numeric,
            xMin as Numeric, xMax as Numeric, yMin as Numeric, yMax as Numeric) as Array<Numeric>
        {
            if(x1 < xMin){
                y1 = interpolateY(x1, y1, x2, y2, xMin);
                x1 = xMin;
            }else if(x1 > xMax){
                y1 = interpolateY(x1, y1, x2, y2, xMax);
                x1 = xMax;
            }
            if(y1 < yMin){
                x1 = interpolateX(x1, y1, x2, y2, yMin);
                y1 = yMin;
            }else if(y1 > yMax){
                x1 = interpolateX(x1, y1, x2, y2, yMax);
                y1 = yMax;
            }
            return [x1, y1] as Array<Numeric>;
        }
    }
}