#  Badminton Management

### Core Data

### 比賽中的資料儲存
documents directory
let url = URL.documentsDirectory.appending(path:
"GamePlaying").appendingPathExtension(for: .json)

暫存檔案：temp directory
iOS 16以上
let tmpDirURL = URL.temporaryDirectory
舊版
let tmpDirURL = FileManager.default.temporaryDirectory

### MVVM-C架構
 
設置 Coordinator 做為「調動頁面出現消失」的主控

