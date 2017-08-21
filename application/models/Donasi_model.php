<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * @property Donasi_model $Donasi_model
 */
class Donasi_model extends CI_Model
{


    public function insertdonasi($donasi)
    {
        $query = $this->db->insert('donasi', $donasi);
        return $query;
    }


    function get_donasi($type,$tahun,$bulan, $page = null, $keyword = null)
    {
        if ($page == null || $page == 1) {
            $page = 1;
        }

        $limit = "10";
        $start = ($page - 1) * $limit;

        $this->db
            ->select("donasi.*,
            muzaki.*,
                        mustahiq.id_mustahiq,
                        mustahiq.status_mustahiq,
                        mustahiq.id_mustahiq as idm,
                       mustahiq.id_calon_mustahiq as idcm,
                        (select avg(rating) from rating_calon_mustahiq where rating_calon_mustahiq.id_calon_mustahiq=idcm) as jumlah_rating,
                         calon_mustahiq.*,
                        calon_mustahiq.id_user_perekomendasi as idnya_id_user_perekomendasi,
                        (SELECT user.nama FROM user WHERE user.id_user = idnya_id_user_perekomendasi) AS nama_perekomendasi_calon_mustahiq,
                       (SELECT GROUP_CONCAT(badan_amil_zakat.nama_badan_amil_zakat SEPARATOR ', ') AS nama_validasi_amil_zakat
FROM
    validasi_mustahiq
    INNER JOIN amil_zakat 
        ON (validasi_mustahiq.id_amil_zakat = amil_zakat.id_amil_zakat)
    INNER JOIN badan_amil_zakat 
        ON (amil_zakat.id_badan_amil_zakat = badan_amil_zakat.id_badan_amil_zakat)
        WHERE validasi_mustahiq.id_mustahiq=idm ) AS nama_validasi_amil_zakat,
        (SELECT GROUP_CONCAT(amil_zakat.id_amil_zakat SEPARATOR ', ') AS id_nama_validasi_amil_zakat
FROM
    validasi_mustahiq
    INNER JOIN amil_zakat
        ON (validasi_mustahiq.id_amil_zakat = amil_zakat.id_amil_zakat)
    INNER JOIN badan_amil_zakat
        ON (amil_zakat.id_badan_amil_zakat = badan_amil_zakat.id_badan_amil_zakat)
        WHERE validasi_mustahiq.id_mustahiq=idm ) AS id_nama_validasi_amil_zakat,
                        amil_zakat.*");
        $this->db->from('donasi');
        $this->db->join('mustahiq', 'donasi.id_mustahiq = mustahiq.id_mustahiq');
        $this->db->join('muzaki', 'donasi.id_muzaki = muzaki.id_muzaki');
        $this->db->join('calon_mustahiq', 'calon_mustahiq.id_calon_mustahiq = mustahiq.id_calon_mustahiq');
        $this->db->join('amil_zakat', 'amil_zakat.id_amil_zakat = mustahiq.id_amil_zakat');



        if ($type != "ALL") {
            $this->db->where('donasi.id_amil_zakat', $type);
        }

        if ($tahun != "ALL") {

            if ($bulan != "ALL") {
                $this->db->like('donasi.waktu_donasi', $tahun."-".$bulan."-", 'after');
            }
            else{
                $this->db->like('donasi.waktu_donasi', $tahun."-", 'after');
            }

            if ($keyword != null) {
                $this->db->or_like('muzaki.no_identitas_muzaki', $keyword);
                $this->db->or_like('muzaki.no_identitas_muzaki', $keyword, 'after');
                $this->db->or_like('muzaki.no_identitas_muzaki', $keyword, 'before');
                $this->db->group_by('muzaki.no_identitas_muzaki');
                $this->db->group_by('donasi.waktu_donasi');
            }
        }
        else{
            if ($keyword != null) {
                $this->db->like('muzaki.no_identitas_muzaki', $keyword);
                $this->db->or_like('muzaki.no_identitas_muzaki', $keyword, 'after');
                $this->db->or_like('muzaki.no_identitas_muzaki', $keyword, 'before');
                $this->db->group_by('muzaki.no_identitas_muzaki');
            }
        }


        $this->db->order_by('id_donasi', 'DESC');
        $this->db->limit($limit, $start);
        $query = $this->db->get();
        return $query->result_array();
    }


    public function get_all_donasi()
    {

        $this->db
            ->select("donasi.*,
            muzaki.*,
                        mustahiq.id_mustahiq,
                        mustahiq.status_mustahiq,
                        mustahiq.id_mustahiq as idm,
                          mustahiq.id_calon_mustahiq as idcm,
                        (select avg(rating) from rating_calon_mustahiq where rating_calon_mustahiq.id_calon_mustahiq=idcm) as jumlah_rating,
                       calon_mustahiq.*,
                        calon_mustahiq.id_user_perekomendasi as idnya_id_user_perekomendasi,
                        (SELECT user.nama FROM user WHERE user.id_user = idnya_id_user_perekomendasi) AS nama_perekomendasi_calon_mustahiq,
                       (SELECT GROUP_CONCAT(badan_amil_zakat.nama_badan_amil_zakat SEPARATOR ', ') AS nama_validasi_amil_zakat
FROM
    validasi_mustahiq
    INNER JOIN amil_zakat
        ON (validasi_mustahiq.id_amil_zakat = amil_zakat.id_amil_zakat)
    INNER JOIN badan_amil_zakat
        ON (amil_zakat.id_badan_amil_zakat = badan_amil_zakat.id_badan_amil_zakat)
        WHERE validasi_mustahiq.id_mustahiq=idm ) AS nama_validasi_amil_zakat,
        (SELECT GROUP_CONCAT(amil_zakat.id_amil_zakat SEPARATOR ', ') AS id_nama_validasi_amil_zakat
FROM
    validasi_mustahiq
    INNER JOIN amil_zakat
        ON (validasi_mustahiq.id_amil_zakat = amil_zakat.id_amil_zakat)
    INNER JOIN badan_amil_zakat
        ON (amil_zakat.id_badan_amil_zakat = badan_amil_zakat.id_badan_amil_zakat)
        WHERE validasi_mustahiq.id_mustahiq=idm ) AS id_nama_validasi_amil_zakat,
                        amil_zakat.*");
        $this->db->from('donasi');
        $this->db->join('mustahiq', 'donasi.id_mustahiq = mustahiq.id_mustahiq');
        $this->db->join('muzaki', 'donasi.id_muzaki = muzaki.id_muzaki');
        $this->db->join('calon_mustahiq', 'calon_mustahiq.id_calon_mustahiq = mustahiq.id_calon_mustahiq');
        $this->db->join('amil_zakat', 'amil_zakat.id_amil_zakat = mustahiq.id_amil_zakat');
        $query = $this->db->get();

        return $query->result_array();
    }

    public function getDonasiById($id_donasi)
    {

        $this->db
            ->select("donasi.*,
            muzaki.*,
                        mustahiq.id_mustahiq,
                        mustahiq.status_mustahiq,
                        mustahiq.id_mustahiq as idm,
                         mustahiq.id_calon_mustahiq as idcm,
                        (select avg(rating) from rating_calon_mustahiq where rating_calon_mustahiq.id_calon_mustahiq=idcm) as jumlah_rating,
                        calon_mustahiq.*,
                        calon_mustahiq.id_user_perekomendasi as idnya_id_user_perekomendasi,
                        (SELECT user.nama FROM user WHERE user.id_user = idnya_id_user_perekomendasi) AS nama_perekomendasi_calon_mustahiq,
                        (SELECT GROUP_CONCAT(badan_amil_zakat.nama_badan_amil_zakat SEPARATOR ', ') AS nama_validasi_amil_zakat
FROM
    validasi_mustahiq
    INNER JOIN amil_zakat
        ON (validasi_mustahiq.id_amil_zakat = amil_zakat.id_amil_zakat)
    INNER JOIN badan_amil_zakat
        ON (amil_zakat.id_badan_amil_zakat = badan_amil_zakat.id_badan_amil_zakat)
        WHERE validasi_mustahiq.id_mustahiq=idm ) AS nama_validasi_amil_zakat,
        (SELECT GROUP_CONCAT(amil_zakat.id_amil_zakat SEPARATOR ', ') AS id_nama_validasi_amil_zakat
FROM
    validasi_mustahiq
    INNER JOIN amil_zakat
        ON (validasi_mustahiq.id_amil_zakat = amil_zakat.id_amil_zakat)
    INNER JOIN badan_amil_zakat
        ON (amil_zakat.id_badan_amil_zakat = badan_amil_zakat.id_badan_amil_zakat)
        WHERE validasi_mustahiq.id_mustahiq=idm ) AS id_nama_validasi_amil_zakat,
                        amil_zakat.*");
        $this->db->from('donasi');
        $this->db->join('mustahiq', 'donasi.id_mustahiq = mustahiq.id_mustahiq');
        $this->db->join('muzaki', 'donasi.id_muzaki = muzaki.id_muzaki');
        $this->db->join('calon_mustahiq', 'calon_mustahiq.id_calon_mustahiq = mustahiq.id_calon_mustahiq');
        $this->db->join('amil_zakat', 'amil_zakat.id_amil_zakat = mustahiq.id_amil_zakat');
        $this->db->where('id_donasi', $id_donasi);
        $query = $this->db->get();

        return $query->row_array();
    }


    function delete_donasi($id)
    {
        $this->db->where('id_donasi', $id);
        $this->db->delete('donasi');
    }

    public function getLastDonasi()
    {

        $this->db
            ->select("donasi.*,
            muzaki.*,
                        mustahiq.id_mustahiq,
                        mustahiq.status_mustahiq,
                        mustahiq.id_mustahiq as idm,
                          mustahiq.id_calon_mustahiq as idcm,
                        (select avg(rating) from rating_calon_mustahiq where rating_calon_mustahiq.id_calon_mustahiq=idcm) as jumlah_rating,
                       calon_mustahiq.*,
                        calon_mustahiq.id_user_perekomendasi as idnya_id_user_perekomendasi,
                        (SELECT user.nama FROM user WHERE user.id_user = idnya_id_user_perekomendasi) AS nama_perekomendasi_calon_mustahiq,
                        (SELECT GROUP_CONCAT(badan_amil_zakat.nama_badan_amil_zakat SEPARATOR ', ') AS nama_validasi_amil_zakat
FROM
    validasi_mustahiq
    INNER JOIN amil_zakat
        ON (validasi_mustahiq.id_amil_zakat = amil_zakat.id_amil_zakat)
    INNER JOIN badan_amil_zakat
        ON (amil_zakat.id_badan_amil_zakat = badan_amil_zakat.id_badan_amil_zakat)
        WHERE validasi_mustahiq.id_mustahiq=idm ) AS nama_validasi_amil_zakat,
        (SELECT GROUP_CONCAT(amil_zakat.id_amil_zakat SEPARATOR ', ') AS id_nama_validasi_amil_zakat
FROM
    validasi_mustahiq
    INNER JOIN amil_zakat
        ON (validasi_mustahiq.id_amil_zakat = amil_zakat.id_amil_zakat)
    INNER JOIN badan_amil_zakat
        ON (amil_zakat.id_badan_amil_zakat = badan_amil_zakat.id_badan_amil_zakat)
        WHERE validasi_mustahiq.id_mustahiq=idm ) AS id_nama_validasi_amil_zakat,
                        amil_zakat.*");
        $this->db->from('donasi');
        $this->db->join('mustahiq', 'donasi.id_mustahiq = mustahiq.id_mustahiq');
        $this->db->join('muzaki', 'donasi.id_muzaki = muzaki.id_muzaki');
        $this->db->join('calon_mustahiq', 'calon_mustahiq.id_calon_mustahiq = mustahiq.id_calon_mustahiq');
        $this->db->join('amil_zakat', 'amil_zakat.id_amil_zakat = mustahiq.id_amil_zakat');
        $this->db->order_by('donasi.id_donasi', 'DESC');
        $this->db->limit(1, 0);
        $query = $this->db->get();

        return $query->row_array();
    }


}