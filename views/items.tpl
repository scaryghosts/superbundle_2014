%include('navbar.tpl')
%import math



<!-- Item Box -->
<div class="container marketing">

    <!--
    The math is here because if the number of items is not divisable by 3 we need to add a row that will have less than
    three columns/items in it.  Since we are dividing here we need to force the divisor to be a float to get a float as a result.
    -->
    %for row in range(1, math.ceil(((len(items) / float(3)) + 1))):
        <div class="row text-center">

            %for column in range(1, 4):
                %if len(items) > 0:
                    %item = items.pop()

                    <div class="col-lg-4">
                        <img class="img-circle" src="{{ item['thumb_image_path'] }}" alt="{{ item['title'] }}" style="width: 140px; height: 140px;">
                        <h2>{{ item['title'] }}</h2>
                        <p>{{ item['description'] }}</p>
                        
                    </div>
                %end
            %end

        </div>
    %end

</div>



%include('footer.tpl')
