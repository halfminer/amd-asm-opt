import xlsxwriter
import csv
import sys
import os

if __name__ == "__main__":
  if (len(sys.argv) != 2):
    print('Wrong args. Should be only input file.')
    exit

  input_file_path = sys.argv[1]
  input_file = open(input_file_path, 'r')
  lines = input_file.readlines()
  workbook = xlsxwriter.Workbook(os.path.splitext(input_file_path)[0] + '(table).xlsx')
  worksheet = workbook.add_worksheet()
  green = workbook.add_format({'bg_color': '#c8f3c8'})
  green.set_align('center')
  green.set_align('vcenter')
  green.set_border()
  red = workbook.add_format({'bg_color': '#eb8484'})
  red.set_align('center')
  red.set_align('vcenter')
  red.set_border()
  bold = workbook.add_format({'bold': True})
  bold.set_align('center')
  bold.set_align('vcenter')
  orange = workbook.add_format({'bg_color': '#FFA500'})
  orange.set_border()
  orange.set_align('center')
  orange.set_align('vcenter')
  line_cnt = 1
  max_instruction_width = 0
  max_vgpr_usage = 0
  worksheet.write(0, 0, 'Instructions', bold)

  green10 = workbook.add_format({'bg_color': '66ff00'})
  green10.set_align('center')
  green10.set_align('vcenter')
  green10.set_border()
  green22 = workbook.add_format({'bg_color': '90ff00'})
  green22.set_align('center')
  green22.set_align('vcenter')
  green22.set_border()
  green34 = workbook.add_format({'bg_color': 'bbff00'})
  green34.set_align('center')
  green34.set_align('vcenter')
  green34.set_border()
  green46 = workbook.add_format({'bg_color': 'e5ff00'})
  green46.set_align('center')
  green46.set_align('vcenter')
  green46.set_border()
  green58 = workbook.add_format({'bg_color': 'ffee00'})
  green58.set_align('center')
  green58.set_align('vcenter')
  green58.set_border()
  green70 = workbook.add_format({'bg_color': 'ffc400'})
  green70.set_align('center')
  green70.set_align('vcenter')
  green70.set_border()
  green82 = workbook.add_format({'bg_color': 'ff9900'})
  green82.set_align('center')
  green82.set_align('vcenter')
  green82.set_border()
  green90 = workbook.add_format({'bg_color': 'ff6e00'})
  green90.set_align('center')
  green90.set_align('vcenter')
  green90.set_border()
  green100 = workbook.add_format({'bg_color': 'ff4500'})
  green100.set_align('center')
  green100.set_align('vcenter')
  green100.set_border()

  for line_ind in range(9, len(lines) - 6):
    #print(line_ind, lines[line_ind])
    splitted_line = lines[line_ind].split(' | ')
    max_instruction_width = max(max_instruction_width, len(splitted_line[3]))
    max_vgpr_usage = max(max_vgpr_usage, int(splitted_line[1].strip()))

  mat = [[0 for _ in range(max_vgpr_usage)] for _ in range(len(lines) - 15)]

  # print(len(mat))
  # print(len(mat[0]))
  for line_ind in range(9, len(lines) - 6):
    splitted_line = lines[line_ind].split(' | ')
    vgpr_pressure = int(splitted_line[1].strip())
    if vgpr_pressure / max_vgpr_usage <= 0.1:
      worksheet.write(line_cnt, 0, splitted_line[3], green10)
    elif  vgpr_pressure / max_vgpr_usage <= 0.22:
      worksheet.write(line_cnt, 0, splitted_line[3], green22)
    elif  vgpr_pressure / max_vgpr_usage <= 0.34:
      worksheet.write(line_cnt, 0, splitted_line[3], green34)
    elif  vgpr_pressure / max_vgpr_usage < 0.46:
      worksheet.write(line_cnt, 0, splitted_line[3], green46)
    elif  vgpr_pressure / max_vgpr_usage < 0.58:
      worksheet.write(line_cnt, 0, splitted_line[3], green58)
    elif  vgpr_pressure / max_vgpr_usage < 0.70:
      worksheet.write(line_cnt, 0, splitted_line[3], green70)
    elif  vgpr_pressure / max_vgpr_usage < 0.85:
      worksheet.write(line_cnt, 0, splitted_line[3], green82)
    elif  vgpr_pressure / max_vgpr_usage < 0.99:
      worksheet.write(line_cnt, 0, splitted_line[3], green90)
    else:
      worksheet.write(line_cnt, 0, splitted_line[3], green100)
    cnt = 0

    for c in splitted_line[2]:
      cnt = cnt + 1
      if cnt > max_vgpr_usage:
        break
      if c == 'x':
        # print(c, 1, line_cnt - 1, cnt - 1)
        mat[line_cnt - 1][cnt - 1] = 1
      elif c == ' ':
        mat[line_cnt - 1][cnt - 1] = 0
      elif c == '^':
      #write
        mat[line_cnt - 1][cnt - 1] = 2
      elif c == 'v':
      #read
        mat[line_cnt - 1][cnt - 1] = 3
      elif c == ':':
        mat[line_cnt - 1][cnt - 1] = 4
    line_cnt = line_cnt + 1

  for line_ind in range(0, line_cnt - 1):
    for i in range(0, max_vgpr_usage):
      if mat[line_ind][i] != 0:
        # print(line_cnt, line_ind, i, mat[line_ind][i])
        if mat[line_ind][i] != 1:
          border_format = workbook.add_format({'bg_color': '#c8f3c8'})
        else:
          border_format = workbook.add_format({'bg_color': '#FFA500'})
        border_format.set_left()
        border_format.set_right()
        if line_ind == 0:
          border_format.set_top()
        elif line_ind > 0 and (mat[line_ind - 1][i] == 0):
          border_format.set_top()
        if line_ind + 2 == line_cnt or (mat[line_ind + 1][i] == 0):
          border_format.set_bottom()
        if line_ind > 0 and mat[line_ind][i] == 2 and mat[line_ind - 1][i] == 3:
          border_format.set_top()

        worksheet.write(line_ind + 1, i + 1, '', border_format)


  
  for i in range(1, max_vgpr_usage + 1):
    worksheet.write(0, i, 'v' + str(i - 1), bold)

  worksheet.set_column(0, 0, max_instruction_width)
  worksheet.set_column(1, 256, 1)

  workbook.close()

  exit