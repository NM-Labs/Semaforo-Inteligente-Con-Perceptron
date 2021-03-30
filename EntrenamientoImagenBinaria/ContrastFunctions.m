classdef ContrastFunctions
   properties
      Value {mustBeNumeric}
   end
   methods
      function p = Inversa(m)
         p = 255 - [m.Value];
         p = uint8(p);
      end
      function p = Cuadrada(m)
         p = [uint16(m.Value)].^2/255;
         p = uint8(p);
      end
      function p = Cubica(m)
         p = [double(m.Value)].^3/255^2;
         p = uint8(p);
      end
      function p = RCuadrada(m)
         p = sqrt(255.*[double(m.Value)]);
         p = uint8(p);
      end
      function p = RCubica(m)
         p = ((255^2).*[double(m.Value)]).^(1/3);
         p = uint8(p);
      end
      function p = Logaritmica(m)
         p = 255*(log(1+[double(m.Value)])/log(1+255));
         p = uint8(p);
      end
   end
end