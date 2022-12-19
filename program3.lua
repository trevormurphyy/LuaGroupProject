--[[
written by:
John Skluzacek
Frank Watring
Trevor Murphy
Mitchell Misischia

a program that reads a file of values from lol.txt and reports Mean, Median, Mode and Range

Correct Terminal Call: "lua54 program3.lua lol.txt"

Parameters
arg[0] = program3.lua
arg[1] = file being read
--]]

-- Global Variables
Contents = {}
Data = {}
Temp_Counter = 0

-- Returns 
function Length_of_file(path)
    local count = 0
    for line in io.lines(path) do
        count = count + 1
        table.insert(Contents, tonumber(line))
    end
    return count
end

-- Inserts the content of solved methods into a combined table to be available to print
function Analyze_data(contents)
    table.insert(Data,Mean(contents))
    table.insert(Data,Median(contents))
    table.insert(Data,Mode(contents))
    local tb = Range(contents)
    table.insert(Data,tb[1])
    table.insert(Data,tb[2])
end

    -- Gets the mean of the table
function Mean(contents)
    -- Add up all of the numbers in the list and divide by total number
    local sum = 0
    for _,i in pairs(contents) do
        sum = sum + i
    end
    return sum / Temp_Counter
end
    
    -- Get the median of a table.
function Median(contents)
  local sorted_List={}

    -- Sort the temp table that contains the sorted list 
  for _,i in pairs(contents) do
      table.insert(sorted_List, i)
  end

  table.sort(sorted_List)

    -- Determining if number of elements is even or odd
  if math.fmod(#sorted_List,2) == 0 then
    
    -- returns the mean value of middle two elements
    return (sorted_List[#sorted_List / 2] + sorted_List[(#sorted_List/2) + 1] ) / 2
  else
    -- return lone middle element
    return sorted_List[math.ceil(#sorted_List / 2)]
  end
end

-- returns the first most commonly reoccuring number in the list
function Mode(contents)
    local counter = {}

    -- Initializing counter for specific numbers
    for _,i in pairs(contents) do
        if counter[i] == nil 
        then 
        counter[i] = 1
        --
        else
        counter[i] = counter[i] + 1
        end  
    end
    -- returns largest number of occurances in the table
    local max = 0
    for _,i in pairs(counter) do
        if i > max
        then
        max = i
        end
    end
      -- creates a new array of the most common occurances of the number 
    local temp={}

    for j,i in pairs(counter) do
    if i == max then
        table.insert( temp, j )
      end
    end

    return temp
end

-- finds and returns the min and max of temps
function Range(contents)
    local min = contents[1]
    local max = contents[1]
    for _,i in pairs(contents) do
      if i > max
      then
        max = i
      end
      if i < min
      then
        min = i
      end
    end
    local minmax = {min,max}
    return minmax
end


-- Prints the according format for Mean, Median, Mode, and Range
function PrintMethod(Data)
    print(  
            "Time Interval: 1/1/2021-12/31/2022"..
            "\nMean:"..string.format("%.2f",Data[1])..
            "\nMedian:"..string.format("%.2f",Data[2]))
            for i in pairs(Data[3]) do
                print("Mode:"..string.format("%.2f",Data[3][i]))
            end
            print("Range:"..string.format("%.2f",Data[4]).."-"..string.format("%.2f",Data[5]))
end

function Main()

    -- Assumption, arg[1] is a text file
    if(arg[1] == nil)
    then
        -- if no file found, prints correct usage and stops program
        print("usage <filename>")
        os.exit()
    elseif not(io.open(arg[1],"r"))
    then
        print("File not Found")
        os.exit()
    else
        -- if file found, program continues
        Temp_Counter = Length_of_file(arg[1])
        Analyze_data(Contents)
        PrintMethod(Data)
    end
end

Main()
