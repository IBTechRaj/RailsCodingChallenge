class Solution

def find_pattern(s)

  h = {}
  d = -1
  max = 0
  count = 0
  endpos = 0
  upat=''

  (0...s.length).each do |i|
    if h[s[i]].nil?
      count += 1
    else
      if count > max
        max = count
        endpos=i
      end

      count = h[s[i]] > d ? i - h[s[i]] : count + 1
      d = h[s[i]] if d < h[s[i]]
    end
    h[s[i]] = i
  end

  max = (max < count ) ? count : max
  endpos = (max <= count)? s.length : endpos
  upat <<s[endpos-max,max]

  upat
end
end