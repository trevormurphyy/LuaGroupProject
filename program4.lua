--[[
written by:
John Skluzacek
Frank Watring
Trevor Murphy
Mitchell Misischia

a program that reads a file and checks if its [({ are balanced
]]--
Stack = {}
Stack.__index = Stack

--stack initializaion method
function Stack:new()
    local instance = setmetatable({}, Stack)
    instance.size = 0
    instance.stackTable = {}
    return instance
end

-- returns the size of the stack
function Stack:size()
    return self.size
end

-- pushes a symbol onto the stack and increments the size by 1 
function Stack:push(data)
    table.insert(self.stackTable, data)
    self.size = self.size + 1
end

-- checks if the size of the stack is empty
function Stack:empty()
    if self.size == 0 then
        return true
    else
        return false
    end
end
-- takes the element at the top of the stack off, and reduces the size by 1 
function Stack:pop()
    if not(self:empty()) then
        table.remove(self.stackTable)
        self.size = self.size -1
        return true
    else
        return false
    end
end
-- returns the top of the stack
function Stack:top()
    return self.stackTable[self.size]
end
-- checks if the file is balanced
function CheckFile(fileName, stack)
    if(fileName == nil) then
        return nil
    end
    local file = io.open(fileName, "r")
    local counter = 0
    for l in file:lines() do
        counter = counter +1
        if not(l == nil) then
            for j = 1, #l do
                local a = l:sub(j,j)
                    -- Checks open {, (, and [ and pushes onto stack
                if(a == "{" or a =="(" or a =="[") then
                        stack:push(a)
                    -- Checks close }, ), and ] and pops off the stack individually
                elseif((a == "}") or (a == ")") or (a == "]")) then
                    if(stack:top() == "{") then
                        stack:pop()
                    elseif((stack:top() == "("))then
                        stack:pop()
                    elseif((stack:top() == "["))then
                        stack:pop()
                    else
                        -- Returns the line horizontally that the error occured at 
                        print("The file is not balanced\nError occured at line: "..tostring(counter))
                        return false
                    end
                end
            end
        end
    end
    file:close()
    return(stack:empty())


end

function Main()
    local s = Stack:new()
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
       if(CheckFile(arg[1],s)) then
            print("File is balanced")
       end
    end
end

Main()

