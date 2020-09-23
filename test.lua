
function openFile()
    if(type(arg[1]) == "string") then
        file = io.open(arg[1], "r")
        if(file == nil) then
            print("No file detected or a problem happened")
            return nil
        end

        return file
    end

    print("There is no file passing as parameter")
    return nil
end

function closeFile(file)
    file:close()
    print("Closing file "..arg[1])
end


function readFileLine(file)
    return file:read("*l")
end

function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end


function main()
    file = openFile()
    i = 1
    repeat
        content = readFileLine(file)
        print(i)
        if(content ~= nil) then
            table = Split(content, " ")
            for k=0, getn(table),1 do
                print(table[k])
            end
        end
        print()
        i = i+1
    until(content == nil)

    closeFile(file)
end

main()