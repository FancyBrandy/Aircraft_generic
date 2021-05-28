with ada.Text_IO;
use ada.Text_IO;
package body Vector_package is

   function size(V: Vector) return Natural is
   begin
      return V.Flag;
   end size;
   
   function first(V: Vector) return Integer is
      arr:TArray:=V.Data;
   begin
      return V.Data(arr'First);
   end first;
   
   function last(V: Vector) return Integer is
   begin
      return V.Data(V.Flag);
   end last;
   
   function is_Empty (V: Vector) return Boolean is 
   begin
      return V.Flag=0;
   end is_Empty;
   
   procedure insert(V: in out Vector; number: Integer) is
   begin
      V.Flag:=V.Flag+1;
      V.Data(V.Flag):=number;
   end insert;
   procedure assign(V: in out Vector; n, number: Integer ) is
   begin
      for i in 1..n loop
         V.Flag:=V.Flag+1;
         V.Data(V.Flag):=number;
      end loop;
      
   end assign;
   
 
   procedure pop(V: in out Vector) is 
   begin
      V.Flag:=V.Flag-1;
   end pop;
   
      
   procedure remove(V: in out Vector; number: Integer; all_occurrences: Boolean:= False) is
      aux:Integer;
   begin
      if all_occurrences=False then
         aux:=0;
         for i in 1..V.Flag loop
            if V.Data(i)=number and aux=0 then
               for j in i..Integer'Pred(V.Flag) loop
               V.Data(j):=V.Data(Integer'Succ(j));
               end loop;
               aux:=1;
            V.Flag:=V.Flag-1;
            end if;
         end loop;
         
      else
         for i in 1..V.Flag loop
            if V.Data(i)=number then
               for j in i..Integer'Pred(V.Flag) loop
               V.Data(j):=V.Data(Integer'Succ(j));
               end loop;
            V.Flag:=V.Flag-1;
            end if;
         end loop;
      end if;
      
   end remove;
   
   procedure swap(V1, V2: in out Vector) is
      temp:Integer;
      temp1:Natural;
   begin
      if V1.flag=V2.flag then
         for i in 1..V1.Flag loop
            temp:=V1.Data(i);
            V1.Data(i):=V2.Data(i);
            V2.Data(i):=temp;
         end loop;
         
      elsif V1.Max>V2.Max then
         if V1.flag<V2.Max then
            if V1.flag>V2.flag then
               for i in 1..V2.Flag loop
                  temp:=V1.Data(i);
                  V1.Data(i):=V2.Data(i);
                  V2.Data(i):=temp;
               end loop;
               temp1:=V2.Flag;
               for j in Positive'Succ(temp1)..V1.Flag loop
                  
                  V2.Flag:=V2.Flag+1;
                  V2.Data(V2.Flag):=V1.Data(j);
               end loop;
               V1.Flag:=temp1;
            else
                for i in 1..v1.Flag loop
                  temp:=V1.Data(i);
                  V1.Data(i):=V2.Data(i);
                  V2.Data(i):=temp;
               end loop;
               temp1:=V1.Flag;
               for j in Positive'Succ(temp1)..V2.Flag loop
                  
                  V1.Flag:=V1.Flag+1;
                  V1.Data(V1.flag):=V2.Data(j);
               end loop;
               V2.Flag:=temp1;
            end if;
         end if;
         
      else
         
         if V2.flag<V1.Max then
            if V1.Flag>V2.flag then
               for i in 1..V2.flag loop
                  temp:=V1.Data(i);
                  V1.Data(i):=V2.Data(i);
                  V2.Data(i):=temp;
               end loop;
               temp1:=V2.Flag;
               for j in Positive'Succ(temp1)..V1.Flag loop
                  
                  V2.Flag:=V2.Flag+1;
                  V2.Data(V2.flag):=V1.Data(j);
               end loop;
               V1.Flag:=temp1;
            else
                for i in 1..V1.flag loop
                  temp:=V1.Data(i);
                  V1.Data(i):=V2.Data(i);
                  V2.Data(i):=temp;
               end loop;
               temp1:=V1.Flag;
               for j in temp1..V2.Flag loop
                 
                  V1.Flag:=V1.Flag+1;
                  V1.Data(V1.flag):=V2.Data(j);
               end loop;
               V2.Flag:=temp1;
            end if;
                  
         end if;
         
      end if;
      
        
   end swap;
   
   procedure join(V1, V2: in out Vector) is
      temp:Natural:=V1.Flag;
   begin
      V1.Flag:=V1.Flag+V2.Flag;
      for i in 1..V2.Flag loop
         V1.Data(i+temp):=V2.Data(i);
      end loop;
   end join;
   
   function compare(V1, V2: Vector) return Boolean is
      aux:Boolean;
      helper:Boolean:=true;
      helper1:Boolean:=true;
   begin
      
      for i in 1..v1.Flag loop
         aux:=False;
         for j in 1..v2.Flag loop
            if V1.Data(i)=V2.Data(j) then
               aux:=True;
            end if;
         end loop;
            
         helper:=helper and aux;
      end loop;
         
      for i in 1..V2.Flag loop
         aux:=False;
         for j in 1..V1.Flag loop
            if V1.Data(j)=V2.Data(i) then
                  
               aux:=True;
            end if;
         end loop;
         helper1:=helper1 and aux;
      end loop;
      helper:=helper and helper1;
      return helper;

   end compare;
   
   procedure copy(V: in out Vector; arr: TArray) is
   begin
      V.Flag:=0;
      for i in arr'Range loop
         V.Flag:=V.Flag+1;
         V.Data(V.Flag):=arr(i);
      end loop;
   end copy;
   
   procedure clear(V: in out Vector) is
   begin
      V.Flag:=0;
   end clear;
   
   procedure print_Vector(V: in Vector) is
   begin
      for i in 1..V.Flag loop
         Put_Line(Integer'Image(V.Data(i)));
      end loop;
   end print_Vector;
      
      
      
end Vector_package;
