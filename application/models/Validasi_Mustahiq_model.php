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



}