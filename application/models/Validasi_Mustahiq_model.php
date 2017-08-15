<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * @property Validasi_Mustahiq_model $Validasi_Mustahiq_model
 */
class Validasi_Mustahiq_model extends CI_Model
{


    public function insertvalidasi($validasi)
    {
        $query = $this->db->insert('validasi_mustahiq', $validasi);
        return $query;
    }

    public function getValidasiByIdMustahiq($id_mustahiq)
    {
        $this->db
            ->select("*");
        $this->db->from('validasi_mustahiq');
        $this->db->where('id_mustahiq', $id_mustahiq);
        $query = $this->db->get();

        return $query->row_array();
    }


    public function getValidasiByIdMustahiqAndIdAmilZakat($id_mustahiq,$id_amil_zakat)
    {
        $this->db
            ->select("*");
        $this->db->from('validasi_mustahiq');
        $this->db->where('id_mustahiq', $id_mustahiq);
        $this->db->where('id_amil_zakat', $id_amil_zakat);
        $query = $this->db->get();

        return $query->row_array();
    }



}