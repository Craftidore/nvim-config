Keymaps = {};

local inspect = require("inspect");

local file = io.open("/home/craftidore/.config/nvim/log", "w");

file.write(file, "Start of log\n");
io.close(file);

-- cmd [[:command! -nargs=1 I lua InspectFn(<f-args>)]]
function InspectFn(obj)
    local file = io.open("/home/craftidore/.config/nvim/log", "a");
    file.write(file, 
        inspect(obj)
    );
    file.write(file, "\n");
    io.close(file);
end

function Print(string)
    local file = io.open("/home/craftidore/.config/nvim/log", "a");
    file.write(file, string);
    io.close(file);
end

function GetMaxPermutations(table)
    Print("Getting Max\n");
    local n = {};
    for i = 1, #table do
        InspectFn(table[i]);
        Print(#table[i]);
        Print("\n");
        n[#n+1] = #table[i];
    end
    return n;
end

function NewPerms(size)
    local t = {};
    for i = 1, size do
        t[#t+1] = 1;
    end
    return t;
end

function NextPerm(perms, maxPerms)
    Print("Starting NextPerm\n");
    Print("Max:");
    InspectFn(maxPerms);
    local keepgoing = true;
    local i = 1;
    while keepgoing do
        Print("Perms\n");
        InspectFn(perms);
        Print("MaxPerms (Pre): ");InspectFn(maxPerms[1]);
        perms[i] = perms[i] + 1;
        Print("MaxPerms (Post): ");InspectFn(maxPerms[1]);
        Print("Comparison: ");
        InspectFn(i);
        InspectFn(perms[i])
        InspectFn(maxPerms[i])
        if perms[i] > maxPerms[i] then
            perms[i] = 1;
            i = i + 1;
            if i > #maxPerms then
                return { table.unpack(maxPerms) };
            end
        else
            keepgoing = false;
        end
    end
    Print("Final Perms\n");
    InspectFn(perms);
    return perms;
end

function ConcatPerms(table, perms)
    local s = "";
    Print("Table\n");
    InspectFn(table);
    Print("Perms\n");
    InspectFn(perms);
    for i = 1, #table do
        s = s..table[i][perms[i]];
    end
    return s;
end

function Keymaps.mass(modes, leftSides, rightSides, argument)
    for i = 1, #modes do
        local leftMax = GetMaxPermutations(leftSides);
        Print("LeftMax\n");
        InspectFn(leftMax);
        local leftPerms = NewPerms(#leftMax);
        local keepgoingLeft = true;
        while keepgoingLeft do
            NextPerm(leftPerms, leftMax)
            if leftPerms == leftMax then
                keepgoingLeft = false;
            end
            local rightMax = GetMaxPermutations(rightSides);
            local rightPerms = NewPerms(#rightMax);
            local keepgoingRight = true;
            while keepgoingRight do
                rightPerms = NextPerm(rightPerms, rightMax);
                if rightPerms == leftPerms then
                    keepgoingRight = false;
                end
                keymap(modes[i],
                ConcatPerms(leftSides, leftPerms), 
                ConcatPerms(rightSides, rightPerms),
                argument);
            end
        end
    end
end

function Keymaps.mass_noremap(modes, leftSides, rightSides)
    Keymaps.mass(modes, leftSides, rightSides, { noremap = true });
end

function Keymaps.mass_silent(modes, leftSides, rightSides)
    Keymaps.mass(modes, leftSides, rightSides, { noremap = true, silent = true });
end

