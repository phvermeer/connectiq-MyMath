import Toybox.Lang;

module MyMath{
    function interpolateY(xOld as Numeric, yOld as Numeric, xNew as Numeric, xRef as Numeric, yRef as Numeric) as Numeric{
        var rc = (yOld-yRef)/(xOld-xRef);
        var yNew = yRef + (xNew-xRef) * rc;
        return yNew;
    }
    function interpolateX(xOld as Numeric, yOld as Numeric, yNew as Numeric, xRef as Numeric, yRef as Numeric) as Numeric{
        return interpolateY(yOld, xOld, yNew, yRef, xRef);
    }
    function interpolateXY(x1 as Numeric, y1 as Numeric, x2 as Numeric, y2 as Numeric,
        xMin as Numeric, xMax as Numeric, yMin as Numeric, yMax as Numeric) as Array<Numeric>
    {
        if(x1 < xMin){
            y1 = interpolateY(x1, y1, xMin, x2, y2);
            x1 = xMin;
        }else if(x1 > xMax){
            y1 = interpolateY(x1, y1, xMax, x2, y2);
            x1 = xMax;
        }
        if(y1 < yMin){
            x1 = interpolateX(x1, y1, yMin, x2, y2);
            y1 = yMin;
        }else if(y1 > yMax){
            x1 = interpolateX(x1, y1, yMax, x2, y2);
            y1 = yMax;
        }
        return [x1, y1] as Array<Numeric>;
    }
}