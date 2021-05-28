with Vector_package, Ada.Command_Line, ada.Text_IO,ada.Integer_Text_IO;
use Vector_package,ada.Text_IO;
procedure Main is

   V:Vector(100);
   V1:Vector(100);
   V2:Vector(100);
   V3:Vector(100);
   V4:Vector(100);
   V5:Vector(100);
   test_Arr: TArray(1..5):=(4,5,6,7,8);
begin


   insert(V,1);
   insert(V,2);
   insert(V,3);
   insert(V,4);
   insert(V,5);

   insert(V1,13);
   insert(V1,13);
   insert(V1,13);
   insert(V1,13);
   insert(V1,13);
   --testing swap
   Put_Line("now we are testing the swap iw should give out 1 2 3 4 5");
   swap(V,V1);
   print_Vector(V1);
   swap(V,V1);
   -- testing the size method:
   Put_Line("now we are testing the size method, it should give out 5");
   Put_Line(Integer'Image(size(V)));
   --testing the second method:
   Put_Line("now we are testing the first method, it should give out 1 ");
   Put_Line(Integer'Image(first(V)));
   --testing the third method
   Put_Line("now we are testing the last method , it should give out 5");
   Put_Line(Integer'Image(last(V)));
   --testing is_empty
   Put_Line("now we are testing the is_Empty method, it should give out the vector is not empty");
   if is_Empty(V) then
      Put_Line("the vector is empty");
   else
      Put_Line("the vector is not empty");
   end if;
   -- testing insert
   Put_Line("now we are testing the insert method, it should give out 1,2,3,4,5,16");
   insert(V,16);
   print_Vector(V);
   -- testing assign
   Put_Line("now we are testing the assign method. it should give out 1 2 3 4 5 16 3 3 3 3 3");
   assign(V,5,3);
   print_Vector(V);
   --testing pop
   Put_Line("now we are testing the pop method, the vectors being printed should have one number which is 9 in this case, difference ");
   insert(V,9);
   print_Vector(V);
   Put_Line("now the next vector");
   pop(V);
   print_Vector(V);
   --testing remove
   Put_Line("now we are testing the remove method with default value false, it should give out 1 2 3 4 5 16 7 7 7 7, ");
   remove(V,3);
   print_Vector(V);
   Put_Line("now we are testing the remove method with true, it should give out 1 2 4 5 16, ");
   remove(V,3,True);
   print_Vector(V);
   Put_Line("and then 1 3 4 5 16");
   remove(V,2,True);
   print_Vector(V);
   --testing join
   Put_Line("now we are testing the join method, it should give out 1 3 4 5 16 13 13 13 13 13");
   join(V,V1);
   print_Vector(V);
   --testing compare
   Put_Line("now we are testing the compare method it should give out v and V2 are not the same");
   Put_Line("and V and V are the same vectors");
   insert(V2,1);
   insert(V2,2);
   insert(V2,3);
   insert(V2,4);
   insert(V2,5);
   if compare(V,V2) then
      Put_Line("V and V2 are the same vector");
   else
      Put_Line("V and V2 are not the same vector");
   end if;
   if compare(V,V) then
      Put_Line("V and V are the same vector");
   else
      Put_Line("V and V are not the same, something is wrong");
   end if;
   -- testing copy
   Put_Line("now we are tesing copy, it should give out 4 5 6 7 8");
   copy(V,test_Arr);
   print_Vector(V);
   --testing clear
   Put_Line("now we are testing clear, it should give out the vector is empty");
   clear(V);
   if is_Empty(V) then
      Put_Line("the vector is empty");
   else
      Put_Line("the vector is not empty, something is wrong");
   end if;


   Put_Line("below is the correction and the testing after the modification of the program:");
   insert(V3,1);
   insert(V3,2);
   insert(V3,3);
   insert(V3,4);
   insert(V3,5);

   insert(V4,5);
   insert(V4,4);
   insert(V4,3);
   insert(V4,2);
   insert(V4,1);

   Put_Line("this should give us V3 and V4 is the same because though the positions of the numbers are not the same but all the numbers are the same");
   if compare(V3,V4) then
      Put_Line("V3 and V4 are the same vectors");
   else
      Put_Line("V3 and V4 are not the same vectors");
   end if;

   Put_Line("the second correction, for the multiple, this should give out V4 and V3 are the same");

   insert(V4,2);
   if compare(V3,V4) then
      Put_Line("V3 and V4 are the same vectors");
   else
      Put_Line("V3 and V4 are not the same vectors");
   end if;

   insert(V5,5);
   insert(V5,4);
   insert(V5,3);
   insert(V5,2);
   insert(V5,2);

   Put_Line("this should print out not the same because V5 does not have number 1");

    if compare(V3,V5) then
      Put_Line("V3 and V4 are the same vectors");
   else
      Put_Line("V3 and V4 are not the same vectors");
   end if;

   Put_Line("Now we test swap, when the length of the vector is not the same");
   insert(V3,9);
   swap(V3,V5);
   print_Vector(V3);
   Put_Line("vector5:");
   print_Vector(V5);
end Main;
