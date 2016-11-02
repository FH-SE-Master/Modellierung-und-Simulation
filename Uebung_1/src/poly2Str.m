function value = poly2Str( poly )
% This function prints the ploynom represented by the line vector
% to its string representation

polySize = size(poly);
cols     = polySize(2);
value    = '';

if(polySize(1) ~= 1)                % Validate for line vector
    error('Only line vectors are allowed');
end

for i=1:1:cols
    polyVal = poly(1, i);
    pot     = cols - i;
    
    if(polyVal ~= 0)                    % print only value != 0
        if((i > 1) && (polyVal >= 0))   % add plus sign if positive number
            value = strcat(value, {' +'});
        end
        value = strcat(value, {' '}, num2str(polyVal));
        if(pot > 1)                     % add pot only if greather than 1
            value = strcat(value,  {' * x^'}, num2str(pot));
        elseif(pot == 1)
            value = strcat(value,  {' * x'});
        end
    end
end

end

