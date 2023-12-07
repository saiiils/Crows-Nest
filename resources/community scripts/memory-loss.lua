--- memory loss
-- each crow can remember songs
-- but some forget more than others
--
-- in 1: v/8 sequence
-- in 2: clock
-- outs 1-4: shift register of memories

s = sequins

memory = {}
loss = {}

function init()
  input[2]{ mode = 'change', direction = 'rising' }

  for i = 1, 16 do
    for j = 1, 4 do
      table.insert(loss, i)
    end
    table.insert(memory, 0)
  end

  math.srandomseed(unique_id())
  for j = (#loss/4), 2, -1 do
    for i = 4,1,-1 do
      local k = math.srandom(j)
      loss[i+4*j-4], loss[i+4*k-4] = loss[i+4*k-4], loss[i+4*j-4]
    end
  end

  loss = s(loss)
end

function remember()
  for n=1,4 do
    output[n].volts = memory[loss()]
  end
end

function forget()
  table.remove(memory)
  if ((unique_id() % 75 + 25)/100 > math.srandom()) then
    table.insert(memory, 1, input[1].volts)
  else
    table.insert(memory, 1, memory[1])
  end
end

input[2].change = function()
   remember()
   forget()
end