local M = {}

function M.concat_tables(t1, t2)
  if t1 == nil and t2 == nil then
    return {}
  end
  if t1 == nil then
    return t2
  end
  if t2 == nil then
    return t1
  end
  for i=1,#t2 do
    t1[#t1+1] = t2[i]
  end
  return t1
end

function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

return M
