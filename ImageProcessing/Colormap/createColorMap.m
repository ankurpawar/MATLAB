function cMap = createColorMap(varargin)
% create color map
DEFAULT_NCOLOR = 32;
midColor = [];
if nargin == 2
    startColor = varargin{1};
    endColor = varargin{2};
    nColor = DEFAULT_NCOLOR;
elseif nargin == 3
    startColor = varargin{1};
    endColor = varargin{2};
    nColor = varargin{3};
elseif nargin == 4
    startColor = varargin{1};
    midColor = varargin{2};
    endColor = varargin{3};
    nColor = varargin{4};
else
    error('incorrect arguments');    
end
cMap = zeros(nColor,3);
if isempty(midColor)
    for n = 1:3
        cMap(:,n) = createPoints(startColor(n), endColor(n), nColor);
    end
else
    u = floor(nColor/2);
    for n = 1:3
        cMap(1:u,n) = linspace(startColor(n), midColor(n), u);
        cMap(u+1:end,n) = linspace(midColor(n), endColor(n), nColor-u);
    end 
end

end %createColorMap end