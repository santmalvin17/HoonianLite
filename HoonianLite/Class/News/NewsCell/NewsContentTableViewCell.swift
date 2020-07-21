//
//  NewsContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class NewsContentTableViewCell: UITableViewCell {

    @IBOutlet weak var newsContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.newsContentLabel.text = """
        PT Adicipta Graha Kencana, anak usaha Serenity Group, berencana meluncurkan Tower 5 proyek apartemen Puri Orchard di Jakarta Barat pada Oktober 2018, setelah sukses memasarkan Tower 1 Sampai 4.

        Marketing Coordinator Puri Orchard Christopher AK mengungkapkan, Tower 1 berisi sekitar 900 unit apartemen yang diluncurkan sejak 15 November 2015
        sudah hampir habis terjual, sementara Tower 2 sebanyak 1.050 unit masih tersedia untuk konsumen.

        “Sambutan konsumen cukup tinggi terhadap Puri Orchard karena lokasinya sangat strategis, berada di pinggir jalan tol Lingkar Luar Barat, dan merupakan proyek apartemen pertama di CBD Puri,” katanya.

        Menurut Christopher, Tower 1 (Orange Groove) akan diserahterimakan kepada konsumen pada April 2018, yang akan disusul serah terima Tower 2 (Cedar Height) pada Oktober 2018.

        Kesuksesan pemasaran kedua tower itu, tuturnya, mendorong perusahaan untuk meluncurkan Tower 3 (Magnolia Springs) pada Oktober tahun ini.

        Tiga tower apartemen itu akan dilengkapi dengan satu tower office dan satu tower hotel bintang 4, sehingga total akan terdapat lima tower dalam satu kawasan (superblock).

        Puri Orchard dibangun di atas lahan seluas 3,6 hektare tepat di jalan raya Jakarta Outer Ring Road (JORR). Jakarta Barat, yang menyediakan akses langsung ke jalan tol JORR W1 dan W2. Lokasi ini diproyeksikan menjadi kawasan terpadu antara residensial, pekantoran dan area komersial.
        """
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
