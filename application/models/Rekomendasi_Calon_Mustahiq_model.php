<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * @property Rekomendasi_Calon_Mustahiq_model $Rekomendasi_Calon_Mustahiq_model
 */
class Rekomendasi_Calon_Mustahiq_model extends CI_Model
{


    public function insertrekomendasi($rekomendasi)
    {
        $query = $this->db->insert('rekomendasi_calon_mustahiq', $rekomendasi);
        return $query;
    }

    public function getRekomendasiByIdCalon_Mustahiq($id_calon_mustahiq)
    {
        $this->db
            ->select("*");
        $this->db->from('rekomendasi_calon_mustahiq');
        $this->db->where('id_calon_mustahiq', $id_calon_mustahiq);
        $query = $this->db->get();

        return $query->row_array();
    }


    public function getRekomendasiByIdCalon_MustahiqAndIdUser($id_calon_mustahiq,$id_user)
    {
        $this->db
            ->select("*");
        $this->db->from('rekomendasi_calon_mustahiq');
        $this->db->where('id_calon_mustahiq', $id_calon_mustahiq);
        $this->db->where('id_user', $id_user);
        $query = $this->db->get();

        return $query->row_array();
    }



}