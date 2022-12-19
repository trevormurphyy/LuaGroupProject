--[[
written by:
John Skluzacek
Frank Watring
Trevor Murphy
Mitchell Misischia

Program #2 bank account program
this program with consist of a bank, customers, and back accounts, with the ability to deposit, withdraw and comit tax fraud
bank "class" that will hold accounts
--]]

-- Global Variables
Bank = {}
Bank.__index = Bank
Account = {}
Account.__index = Account
AccountNumIterator = 0;

--******************************************************************************
-- Bank Class
function Bank:new(bank)
    local instance = setmetatable({}, Bank)
    instance.bankName = bank
    instance.accounts = {}
    return instance
end

-- Returns the account that matches accountNumber and pin 
function Bank:getAccount(accountNum,pin)
    for _,j in pairs(self.accounts) do
        if j.accountNumber == accountNum and j.pin == pin
        then
            return j
        end
    end
    print("Account not found")
    return nil
end

-- Returns bankName
function Bank:getBankName()
    return self.bankName
end

-- Prints bankName
function Bank:DisplayName()
    print(self.bankName)
end

-- Inserts parameter account to the table of accounts
function Bank:addAccount(account)
    table.insert(self.accounts, account)
end

-- Generates accountNumber for created account
function Bank:genAccountNum()
    AccountNumIterator = AccountNumIterator + 1
    return tostring(AccountNumIterator)
end
--******************************************************************************

--******************************************************************************
-- Account Class
function Account:new(fName, lName, pin)
    local instance = setmetatable({}, Account)
    instance.accountNumber = Bank:genAccountNum()
    instance.accountBalance = 0.0
    instance.pin = pin
    instance.fName = fName
    instance.lName = lName
    return instance
end
-- Account Deposit adds parameter to current account balance
function Account:Deposit(amount)
    self.accountBalance = self.accountBalance + amount
    return self.accountBalance
end

-- Account Withdraw subtracts parameter to current balance if possible 
function Account:Withdraw(amount)
    if (self.accountBalance < amount)
    then
        return print("Insufficient funds.")
    else
        self.accountBalance = self.accountBalance - amount
        return print("New Balance: ", self.accountBalance)
    end
end
-- Returns accountNumber
function Account:getAccountNumber()
    return self.accountNumber
end

-- Returns accountBalance
function Account:getBalance()
    return self.accountBalance
end

-- Returns fName
function Account:getFName()
    return self.fName
end

-- Returns lName
function Account:getLName()
    return self.lName
end

-- Returns pin
function Account:getPin()
    return self.pin
end
--******************************************************************************
--Functions
function PrintLogInMenu()
    print(
        "\n\nWelcome to the bank of ISU\nPlease select an option\n" ..
        "*************************************************"..
        "\n1 - Deposit"..
        "\n2 - Withdraw"..
        "\n3 - Check balance"..
        "\n4 - Log out"..
        "\n5 - Exit Program")

end

function PrintMainMenu()
    print("\nEnter Credentials\n" ..
    "*************************************************"..
    "\n1. Login to account: "..
    "\n2. Create account"..
    "\n3. Exit program")
end

function Run()
    ::start::
    io.flush()
    local acc = nil
    local choice = nil

    PrintMainMenu()

    io.write("Select a Menu Option: > ")
    choice = io.read()

    if choice == "1"
    then
        print("please provide account number")
        local accNum = io.read()
        print("please provide pin")
        local pin = io.read()

        acc = BankOfIsu:getAccount(accNum,pin)

        if not(acc)
        then
            print("Invalid Account")
            goto start
        end
    elseif(choice == "2") then
        print("please enter first name\n")
        local fname = io.read()
        print("please enter last name\n")
        local lname = io.read()
        print("please enter pin number\n")
        local pin = io.read()
        io.flush()
        local temp = Account:new(fname,lname,pin)
        BankOfIsu:addAccount(temp)
        print("account added successfully!\nYour account number is: "..temp.accountNumber)
        goto start
    elseif choice == "3" then
        print("GoodBye :)")
        os.exit()
    else
        print("Invalid Choice")
        goto start
    end

    --start of account menu
    while choice ~= "4" do
        io.flush()
        PrintLogInMenu()
        io.write("Select a Menu Option: > ")
        choice = io.read()

        if choice == "1" then
            io.write("How much would you like to deposit? > ")
            local amount = io.read()
            amount = tonumber(amount)
            if(amount > 0)
            then
                acc:Deposit(amount)
                print("New Balance: ", acc:getBalance())
            else
                print("Invalid amount")
            end
            io.flush()
        elseif choice == "2" then
            io.write("How much would you like to withdraw? > ")
            local amount = io.read()
            amount = tonumber(amount)
            if(acc:getBalance() > amount)
            then
                acc:Withdraw(amount)
            else
                print("Cannot withdraw more than you currently have")
            end
        elseif choice == "3" then
            print("Your Current Balance is: "..tostring(acc:getBalance()))

        elseif choice == "4" then
            print("Loging out")
        elseif choice == "5" then
            print("goodbye")
            os.exit()
        end
    end
    goto start
end


--Main function
function Main()
    BankOfIsu = Bank:new("Bank Of Isu")
    local temp = Account:new("Mitchell", "Misischia", "1121")
    BankOfIsu:addAccount(temp)
    temp = Account:new("Mary Elaine", "Califf", "6584")
    BankOfIsu:addAccount(temp)
    temp = Account:new("North", "West", "2235")
    BankOfIsu:addAccount(temp)
    temp = Account:new("South", "West", "3123")
    BankOfIsu:addAccount(temp)
    temp = Account:new("Maria", "Smith", "2241")
    BankOfIsu:addAccount(temp)
    temp = Account:new("F.", "Scott Fitzgerald", "5555")
    BankOfIsu:addAccount(temp)
    temp = Account:new("Elon", "Musk", "1984")
    BankOfIsu:addAccount(temp)
    temp = Account:new("Taco", "Bell", "9182")
    BankOfIsu:addAccount(temp)
    Run()
end

--start of the program for user interface and stuff
Main()


